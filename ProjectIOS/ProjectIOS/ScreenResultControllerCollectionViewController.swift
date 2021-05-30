//
//  ScreenResultControllerCollectionViewController.swift
//  ProjectIOS
//
//  Created by intozoom on 5/29/21.
//

import UIKit



class ScreenResultControllerCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    private let data:[String] = ["A1","A2","A3","B1","B2","B3","D1","D1","D3","F1","F2"]
    private let result:[Int] = [0,1,0,1,0,1,0,0,0,1,1]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        collectionView.dataSource = self

    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) 

                headerView.layer.borderColor = UIColor.black.cgColor
                headerView.layer.borderWidth = 1
                
                return headerView

            default:

                assert(false, "Unexpected element kind")
            }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.result(with: data[indexPath.row],with: result[indexPath.row])
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.layer.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return cell
        }
}
