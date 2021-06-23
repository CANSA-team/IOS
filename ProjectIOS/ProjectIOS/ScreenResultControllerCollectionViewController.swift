//
//  ScreenResultControllerCollectionViewController.swift
//  ProjectIOS
//
//  Created by Hoàng Anh on 5/29/21.
//  Đây là file để controller Màn hình result
//

import UIKit
import Firebase


class ScreenResultControllerCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    private var resultStr:String = "";
    private var totalResult:String = "";
    private var deathPoints:[Int] = [];

  
    @IBAction func btnQuestionReturn(_ sender: Any) {
        DataPassing.removeDataAll();
        
        TienIch.CreateCauHoisByLoaiBangToDataPassing(DataPassing.loaiBang)
        
        DataPassing.countCauHois = DataPassing.cauHois.count;
        DataPassing.results = TienIch.CreateResultsByCount(DataPassing.countCauHois);
        
        //MARK: tạo mảng câu đáp án theo số lượng câu hỏi lưu vào màn hình câu hỏi
        let count = DataPassing.cauHois.count;
        DataPassing.results = TienIch.CreateResultsByCount(count);
        let main = LoadScreenController.storyboard?.instantiateViewController(withIdentifier: "Main") as! ScreenMainController
        let question = LoadScreenController.storyboard?.instantiateViewController(withIdentifier: "Question") as! ScreenQuestionController
        LoadScreenController.navigationController.setViewControllers([main,question], animated: true)
    }
    
    @IBAction func homeBtn(_ sender: Any) {
            DataPassing.removeDataAll();
            
        let main = LoadScreenController.storyboard?.instantiateViewController(withIdentifier: "Main") as! ScreenMainController
        LoadScreenController.navigationController.setViewControllers([main], animated: true)

    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: lưu kết quả lên firebase theo dạng "đậu" - "20/20"
        
        totalResult = "\(TienIch.CountTrueChoseResult(DataPassing.results))/\(DataPassing.results.count)";
        getDeathPoints();
        
        var ref:DatabaseReference!
        ref = Database.database().reference(withPath: "user's result");
        ref.childByAutoId().setValue([resultStr:totalResult]);
        
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        collectionView.dataSource = self
        collectionView.delegate = self 
        
        //Ghim footer và header cố định
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        layout?.sectionFootersPinToVisibleBounds = true
        
    }
    //Để Hidden Navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //MARK: tạo ngẫu nhiên câu hỏi điểm liệt và kiểm tra kết quả theo loại bằng
    func getDeathPoints(){
        var n:Int = 0;
        switch DataPassing.loaiBang {
        case ScreenMainController.data[0]:
            n = 1;
            deathPoints = TienIch.RandomDeathPoints(n, DataPassing.results.count);
            resultStr = TienIch.CheckResult(DataPassing.results, deathPoints, 16);
            break;
        case ScreenMainController.data[1]:
            n = 1;
            deathPoints = TienIch.RandomDeathPoints(n, DataPassing.results.count);
            resultStr = TienIch.CheckResult(DataPassing.results, deathPoints, 18);
            break;
        case ScreenMainController.data[2],ScreenMainController.data[3]:
            n = 2;
            deathPoints = TienIch.RandomDeathPoints(n, DataPassing.results.count);
            resultStr = TienIch.CheckResult(DataPassing.results, deathPoints, 18);
            break;
        case ScreenMainController.data[4]:
            n = 3;
            deathPoints = TienIch.RandomDeathPoints(n, DataPassing.results.count);
            resultStr = TienIch.CheckResult(DataPassing.results, deathPoints, 26);
            break;
        case ScreenMainController.data[5],ScreenMainController.data[6],ScreenMainController.data[7],ScreenMainController.data[8],ScreenMainController.data[9]:
            n = 3;
            deathPoints = TienIch.RandomDeathPoints(n, DataPassing.results.count);
            resultStr = TienIch.CheckResult(DataPassing.results, deathPoints, 28);
            break;
        default:
            break
        }
        
    }
    
    //Set header Kết quả 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataPassing.results.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ResultView
                headerView.setResult(with: resultStr, with: totalResult) //Đây là dữ liệu cần đổ
                
                return headerView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
            return footerView
            default:

                assert(false, "Unexpected element kind")
            }
        return UICollectionReusableView()
    }
    //Set footer Đổ những câu đúng sai
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.result(with: DataPassing.results[indexPath.row]) // Đây là 2 mảng 1 là tên title 2 là màng đúng sai biểu thị dưới 1 và 0,có thể cấu hình func result bên file CollectionViewCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
        }
}
