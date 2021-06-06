//
//  QuestionView.swift
//  ProjectIOS
//
//  Created by intozoom on 5/28/21.
//

import UIKit

class QuestionView: UICollectionReusableView {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var Question: UILabel!
    
    func SetQuestion(with str:String,with img:String){
        Question.text = str
        image.image = UIImage(named: img)
    }
    
}
