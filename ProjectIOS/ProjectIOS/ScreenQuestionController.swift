//
//  ScreenQuestionController.swift
//  ProjectIOS
//
//  Created by Hoàng Anh on 5/28/21.
//

import UIKit

class ScreenQuestionController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var cauHoiDemo:String = "" //Khởi tạo các câu hỏi có gía trị rỗng
    var data:[String] = [] //Đây là mảng câu hỏi
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cauHoiDemo = "Muon Dep trai Phai Lam The Nao??" //Đây là câu hỏi demo
        data = [String(DataPassing.shared.count),"Uong Nước lã","Dầu hỏa","Choi Cần Sa"] //Đây là câu hỏi demo DataPassing.shared.count để biểu diễn thay đổi giữa Datapassing và controller
        //Dua vao count de tim trong mang passing
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        self.title = String(DataPassing.shared.count)+"/25" //Set Tittle
        let time = UIBarButtonItem(title: "Time 25:25",
                                       style: .done,
                                           target: nil,
                                           action: nil)
            time.isEnabled = true
        navigationItem.rightBarButtonItem = time //Add thời gian chỉ có tìm cách đổ button vào navigation
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        layout?.sectionFootersPinToVisibleBounds = true
    }
    
    //Event của 2 nút button trái phải
    
    @IBAction func btnLeft(_ sender: Any) {
        //Sukien Click
        //Khi Click nó sẽ load lại storyBoard chỉ cần mỗi lần thay đổi DataPassing nó sẽ đổi toàn bộ
        if(DataPassing.shared.count<=0){
            DataPassing.shared.count = 0
        }else{
            DataPassing.shared.count -= 1
            viewDidLoad()
        }
    }
    
    @IBAction func btnRight(_ sender: Any) {
        DataPassing.shared.count += 1
        self.viewDidLoad()
    }
    //Set câu hỏi
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! QuestionView
                headerView.SetQuestion(with: cauHoiDemo,with: "A1") //Set Cau hoi,có thế custorm func SetQuestion ở bên File QuestionView
                return headerView

            case UICollectionView.elementKindSectionFooter:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) 
                
                return footerView

            default:

                assert(false, "Unexpected element kind")
            }
        return UICollectionReusableView()
    }
    func changeQuestion(){
        
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
        cell.ConfigQuestion(with: data[indexPath.row] ) //Đổ Câu trả lời,Có thể custorm func ConfigQuestion bên file CollectionViewCell
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
