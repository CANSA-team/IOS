//
//  ScreenMainController.swift
//  ProjectIOS
//
//  Created by intozoom on 5/28/21.
//

import UIKit

class ScreenMainController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    private let data:[String] = ["A1","A2","A3","B1","B2","B3","D","E","F"]
    private let img:[String] = ["A1","A2","A3","B1","B2","B3","D","E","F"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.backgroundColor = .purple
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configButton(with: "License "+data[indexPath.row],with: img[indexPath.row])
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
        }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
                return headerView

            default:

                assert(false, "Unexpected element kind")
            }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let width = view.frame.size.width - 22
        return CGSize(width: width - 16, height: 200)
    }
    
}

