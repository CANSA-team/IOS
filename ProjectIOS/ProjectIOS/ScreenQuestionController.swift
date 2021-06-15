//
//  ScreenQuestionController.swift
//  ProjectIOS
//
//  Created by Hoàng Anh on 5/28/21.
//

import UIKit

class ScreenQuestionController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var cauHoi:String = ""
    var data:[String] = []
    var img:String = ""
    var cauHoiCount : Int = -1
    var time:UIBarButtonItem = UIBarButtonItem()
    var flagTime:Bool = true
    var timeStr:String = "";
    var countdownTime:Int = 0;
    var back:UIBarButtonItem = UIBarButtonItem();
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DataPassing.shared.countresult = 0
        cauHoi = DataPassing.cauHois[DataPassing.shared.count].getCauHoi()
        img = DataPassing.cauHois[DataPassing.shared.count].getHinhAnh()
        data = DataPassing.cauHois[DataPassing.shared.count].getCauTraLoi()
        cauHoiCount = DataPassing.cauHois.count
        DataPassing.shared.couHoi = DataPassing.cauHois[DataPassing.shared.count]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        
        
        self.title = "\(DataPassing.shared.count+1)/\(cauHoiCount)  \(DataPassing.loaiBang)" //Set Tittle
        //MARK: để countdowwn -> dùng timer countdown, thời gian dùng hằng bên LoadScreenController
            
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        layout?.sectionFootersPinToVisibleBounds = true
        
        if(flagTime)
        {
            self.getTime();
            TienIch.CreateResultsByCount(cauHoiCount)
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                self.countdownTime = TienIch.ChangeStringToTime(self.timeStr);
                self.countdownTime -= 1;
                if(self.countdownTime == 0)
                {
                    Timer.invalidate()
                    self.performSegue(withIdentifier: "resultScreen", sender: nil)
                }
                self.timeStr = TienIch.ChangeTimeToString(self.countdownTime);
                self.time = UIBarButtonItem(title: self.timeStr,
                style: .done,
                    target: nil,
                    action: nil)
                self.time.isEnabled = true
                self.navigationItem.rightBarButtonItem = self.time
                }
            
            self.back = UIBarButtonItem(title: "Back",
                                        style: .plain,
                                        target: self,
                                        action: #selector(BackButton(sender:)))
            
            self.navigationItem.leftBarButtonItem = back
            flagTime = false
        }
    }
    
    @objc func BackButton(sender: UIBarButtonItem!) {
        self.performSegue(withIdentifier: "backMain", sender: nil)
    }
    
    //MARK: lấy thời gian của loại bằng
    func getTime(){
        switch DataPassing.loaiBang {
        case ScreenMainController.data[0],ScreenMainController.data[1],ScreenMainController.data[2],ScreenMainController.data[3]:
            self.timeStr = LoadScreenController.COUNTDOWN_BANG_A;
        default:
            self.timeStr = LoadScreenController.COUNTDOWN_BANG_A;
        }
    }
    
    //Event của 2 nút button trái phải
    
    @IBAction func btnLeft(_ sender: Any) {
        //Sukien Click
        //Khi Click nó sẽ load lại storyBoard chỉ cần mỗi lần thay đổi DataPassing nó sẽ đổi toàn bộ
        
        DataPassing.shared.allButtons = [UIButton]()
        if(DataPassing.shared.count<=0){
            DataPassing.shared.count = DataPassing.cauHois.count - 1
        }else{
            DataPassing.shared.count -= 1
        }
        viewDidLoad()
    }
    
    @IBAction func btnRight(_ sender: Any) {
        DataPassing.shared.allButtons = [UIButton]()
        if(DataPassing.shared.count == (DataPassing.cauHois.count-1)){
            DataPassing.shared.count = 0
        } else{
            DataPassing.shared.count += 1
        }
        self.viewDidLoad()
    }
    //MARK: Check Cau hoi
  
    //Set câu hỏi
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! QuestionView
                headerView.SetQuestion(with: cauHoi,with: img) //Set Cau hoi,có thế custorm func SetQuestion ở bên File QuestionView
                return headerView

            case UICollectionView.elementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) 
                
                return footerView

            default:

                assert(false, "Unexpected element kind")
            }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.size.width - 22
        return CGSize(width: width - 16, height: 200)
    }
    //Set Fotter
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = view.frame.size.width - 22
        return CGSize(width: width - 16, height: 100)
    }
    
  
    //Set Cell Answer

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.ConfigQuestion(with: data[indexPath.row]) //Đổ Câu trả lời,Có thể custorm func ConfigQuestion bên file CollectionViewCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    //Resize khi Rolation
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = view.frame.size.width - 22
            return CGSize(width: width - 16, height: 100)
        }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
            if UIDevice.current.orientation.isLandscape,
                let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = view.frame.height - 22
                layout.itemSize = CGSize(width: width - 16, height: 100)
                layout.invalidateLayout()
            } else if UIDevice.current.orientation.isPortrait,
                let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = view.frame.width - 22
                layout.itemSize = CGSize(width: width - 16, height: 100)
                layout.invalidateLayout()
            }
        }
    
}
