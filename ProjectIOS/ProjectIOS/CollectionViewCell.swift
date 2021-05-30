//
//  CollectionViewCell.swift
//  ProjectIOS
//
//  Created by intozoom on 5/28/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var btnContent: UIButton!
    @IBOutlet weak var QuestionButton: UIButton!
    @IBOutlet weak var LableQuestion: UILabel!
    
    @IBOutlet weak var LableResult: UILabel!
    
    func result(with str:String,with check:Int){
        LableResult.text = str
        if (check == 1){
            LableResult.backgroundColor = .green
        }else{
            LableResult.backgroundColor = .red
        }
    }
    func configButton(with str : String){
        btnContent.titleLabel?.lineBreakMode = .byWordWrapping
        btnContent.titleLabel?.textAlignment = .center
        btnContent.setTitle(str, for: .normal)
        btnContent.addTarget(self,action: #selector(didPressButton(sender:)), for: .touchUpInside)
    }
    func ConfigQuestion(with str:String) {
        LableQuestion.text = str
        DataPassing.shared.allButtons.append(QuestionButton)
        QuestionButton.addTarget(self,action: #selector(SellectButton(sender:)), for: .touchUpInside)
    }
    
    @objc func didPressButton(sender: UIButton!) {
        DataPassing.shared.loaiBang = sender.currentTitle
    }
    //Radio Button Event
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
