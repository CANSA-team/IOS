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
    func result(with result:Results){
        checkResult.setTitle("\(result.answeredIndex+1)", for: .normal)
        if (result.resource == true){
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
        if(DataPassing.shared.countresult == DataPassing.results[DataPassing.shared.count].choses){
            QuestionButton.isSelected = true
            DataPassing.results[DataPassing.shared.count].resource = (DataPassing.shared.countresult == DataPassing.shared.couHoi.dapAn)
            DataPassing.results[DataPassing.shared.count].choses = DataPassing.shared.countresult
        }else{
            QuestionButton.isSelected = false
        }
        DataPassing.shared.allButtons.append(QuestionButton) //Đổ thêm nút button vào mảng Button
        
        QuestionButton.addTarget(self,action: #selector(SellectButton(sender:)), for: .touchUpInside) //đây là sự kiện
        DataPassing.shared.countresult += 1
    }
    
    //Set Sự kiện cho mỗi button bên màn hình main
    @objc func didPressButton(sender: UIButton!) {
        //Khi click vào thì sẽ gán cho DataPassing
        DataPassing.shared.loaiBang = sender.currentTitle
        
        let loaiBang:String = sender.currentTitle ?? "";
        
        
        
        
        //MARK: tạo ra mảng câu hỏi theo từng loại bằng lưu vào màn hình câu hỏi
        
        //// tạo ra mảng câu hỏi theo từng loại bằng lưu vào DataPassing
        //TienIch.CreateCauHoisByLoaiBangToDataPassing(loaiBang);
        
        TienIch.CreateCauHoisByLoaiBangToDataPassing(loaiBang)
        
        DataPassing.loaiBang = loaiBang;
        DataPassing.countCauHois = DataPassing.cauHois.count;
        DataPassing.results = TienIch.CreateResultsByCount(DataPassing.countCauHois);
        
        //MARK: tạo mảng câu đáp án theo số lượng câu hỏi lưu vào màn hình câu hỏi
        let count = DataPassing.cauHois.count;
        DataPassing.results = TienIch.CreateResultsByCount(count);
    }
    
    //check button
    //Set Sự kiện RadioButton cho những button câu trả lời
    @objc func SellectButton(sender: UIButton!) {
        
        var count = 0
        
        for btn in DataPassing.shared.allButtons{
            if btn != sender{
                btn.isSelected = false;
            }else{
                btn.isSelected = true;
                DataPassing.results[DataPassing.shared.count].resource = (count == DataPassing.shared.couHoi.dapAn)
                DataPassing.results[DataPassing.shared.count].choses = count
            }
            count += 1
            
        }
    }
}
