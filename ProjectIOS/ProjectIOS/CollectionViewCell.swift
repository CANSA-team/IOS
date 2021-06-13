//
//  CollectionViewCell.swift
//  ProjectIOS
//
//  Created by Hoàng Anh on 5/28/21.
//  File này được sử dụng khi được các collectionView kế thừa để đổ dữ liệu vào
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var btnContent: UIButton!
    @IBOutlet weak var QuestionButton: UIButton!
    @IBOutlet weak var LableQuestion: UILabel!
    
    @IBOutlet weak var checkResult: UIButton!
    
    //Đây là hàm set kết quả cho màn hình Result
    func result(with str:String,with check:Int){
        checkResult.setTitle(str, for: .normal)
        if (check == 1){
            checkResult.setImage(UIImage(named: "true"), for: .normal)

        }else{
            checkResult.setImage(UIImage(named: "false"), for: .normal)

        }
    }
    //Set nút button của màn hình main
    func configButton(with str : String,with img:String){
        btnContent.setTitle(str, for: .normal)
        btnContent.setImage(UIImage(named: img), for: .normal)
        btnContent.addTarget(self,action: #selector(didPressButton(sender:)), for: .touchUpInside)
        
    }
    //Đây là hàm đổ câu trả lời
    func ConfigQuestion(with str:String) {
        LableQuestion.text = str
        DataPassing.shared.allButtons.append(QuestionButton) //Đổ thêm nút button vào mảng Button
        QuestionButton.addTarget(self,action: #selector(SellectButton(sender:)), for: .touchUpInside) //đây là sự kiện
    }
    
    //Set Sự kiện cho mỗi button bên màn hình main
    @objc func didPressButton(sender: UIButton!) {
        //Khi click vào thì sẽ gán cho DataPassing
        DataPassing.shared.loaiBang = sender.currentTitle
    }
    
    //check button
    //Set Sự kiện RadioButton cho những button câu trả lời
    @objc func SellectButton(sender: UIButton!) {
        if sender.isSelected{
            sender.isSelected = false
            
        }else{
            sender.isSelected = true
            for btn in DataPassing.shared.allButtons{
                if btn != sender{
                    btn.isSelected = false
                }
            }
        }
    }
}
