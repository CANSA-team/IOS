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
            let url = URL(string: img)
            if let data = try? Data(contentsOf: url!){ //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
           
            //MARK: chỗ này load hình ảnh từ url, nếu biết xài picasso thì dùng, không thì tạo hàm load hình vê
            
            self.image.image = UIImage(data: data) //Set Hình Ảnh câu hỏi
            }else{
                self.image.image = UIImage()
            }
        }else{
            self.image.image = UIImage()
        }
    }
    
}
