//
//  ScreenQuestionController.swift
//  ProjectIOS
//
//  Created by intozoom on 5/28/21.
//

import UIKit

class ScreenQuestionController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var cauHoiDemo:String = ""
    var data:[String] = []
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cauHoiDemo = "Muon Dep trai Phai Lam The Nao??" //Day la cau hoi
        data = [String(DataPassing.shared.count),"Uong Nước lã","Dầu hỏa","Choi Cần Sa"] //Day la cau tra loi
        //Dua vao count de tim trong mang passing
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        self.title = String(DataPassing.shared.count)+"/25" //Day la title
        let time = UIBarButtonItem(title: "Time 25:25",
                                       style: .done,
                                           target: nil,
                                           action: nil)
            time.isEnabled = true
        navigationItem.rightBarButtonItem = time
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        layout?.sectionFootersPinToVisibleBounds = true
    }
    
    //Event
    
    @IBAction func btnLeft(_ sender: Any) {
        //Sukien Click
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
    //Set Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! QuestionView
                headerView.SetQuestion(with: cauHoiDemo,with: "A1") //Set Cau hoi
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
        cell.ConfigQuestion(with: data[indexPath.row] )
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
                print(1)
            } else if UIDevice.current.orientation.isPortrait,
                let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = view.frame.width - 22
                layout.itemSize = CGSize(width: width - 16, height: 100)
                layout.invalidateLayout()
                print(2)
            }
        }
    
}
