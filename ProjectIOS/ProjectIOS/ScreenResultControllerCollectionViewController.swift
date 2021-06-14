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
    private let data:[String] = ["1","2","3","4","5","6","7","8","9","10","11"] // Đây là mảng câu số... title của các kết quả nằm ở dưới collectionView
    private let result:[Int] = [0,1,0,1,0,1,0,0,0,1,1] //Tương ứng với số câu ở trên đây là mảng chứa các đáp án 1 là đúng 0 là sai

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DataPassing.removeDataAll()
        //MARK: lưu kết quả lên firebase theo dạng "đậu" - "20/20"

        
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
    //Set header Kết quả 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataPassing.results.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ResultView
                headerView.setResult(with: "Dau", with: "5/25") //Đây là dữ liệu cần đổ 
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
