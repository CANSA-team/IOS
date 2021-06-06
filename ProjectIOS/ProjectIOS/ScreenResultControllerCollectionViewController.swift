//
//  ScreenResultControllerCollectionViewController.swift
//  ProjectIOS
//
//  Created by intozoom on 5/29/21.
//

import UIKit



class ScreenResultControllerCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    private let data:[String] = ["1","2","3","4","5","6","7","8","9","10","11"]
    private let result:[Int] = [0,1,0,1,0,1,0,0,0,1,1]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        switch kind {

            case UICollectionView.elementKindSectionHeader:

                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ResultView
                headerView.setResult(with: "Dau", with: "5/25")
                return headerView

            default:

                assert(false, "Unexpected element kind")
            }
        return UICollectionReusableView()
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
