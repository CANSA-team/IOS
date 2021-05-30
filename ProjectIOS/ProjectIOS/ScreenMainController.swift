//
//  ScreenMainController.swift
//  ProjectIOS
//
//  Created by intozoom on 5/28/21.
//

import UIKit

class ScreenMainController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    private let data:[String] = ["A1","A2","A3","B1","B2","B3","D1","D1","D3","F1","F2"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create your custom collectionView.
        collectionView.dataSource = self
        collectionView.delegate = self
        title = "Chọn loại bằng"

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configButton(with: data[indexPath.row]+"\n"+"112/122")
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.layer.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return cell
        }
}

