//
//  QuestionView.swift
//  ProjectIOS
//
//  Created by Hoàng Anh on 5/28/21.
//

import UIKit

class QuestionView: UICollectionReusableView{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var Question: UILabel!
    

    func SetQuestion(with str:String,with img:String){
        self.Question.text = str //Set câu hỏi
        if(img.count > 0){
            //MARK: chỗ này load hình ảnh từ url, nếu biết xài picasso thì dùng, không thì tạo hàm load hình vê
            self.image.image = UIImage(named: img) //Set Hình Ảnh câu hỏi
        }
    }
    
}
