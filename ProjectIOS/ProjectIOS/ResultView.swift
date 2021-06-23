//
//  ResultView.swift
//  ProjectIOS
//
//  Created by Hoàng Anh on 6/6/21.
//

import UIKit

class ResultView: UICollectionReusableView {
        
    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var trueView: UILabel!
    func setResult(with result:String,with trueAwe:String){
        resultView.text = result //Set title Result
        trueView.text = trueAwe //Set Số câu đúng
    }
    
}
