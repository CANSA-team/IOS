//
//  ScreenQuestionController.swift
//  ProjectIOS
//
//  Created by intozoom on 5/28/21.
//

import UIKit

class ScreenQuestionController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    private let data:[String] = ["A1","A2","A3","B1","B2","B3jsdvohdbsoghoihgdishgpisd"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        collectionView.dataSource = self
        collectionView.delegate = self

    }
    //Set Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! QuestionView

                headerView.layer.borderColor = UIColor.black.cgColor
                headerView.layer.borderWidth = 1
                headerView.SetQuestion(with: "123")
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
        return CGSize(width: width - 16, height: 300)
    }
    //Set Fotter

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = view.frame.size.width - 22
        return CGSize(width: width - 16, height: 50)
    }
    
  
    //Set Cell Answer

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.ConfigQuestion(with: data[indexPath.row])
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
