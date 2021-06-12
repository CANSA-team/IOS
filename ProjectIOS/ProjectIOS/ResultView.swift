//
//  ResultView.swift
//  ProjectIOS
//
//  Created by intozoom on 6/6/21.
//

import UIKit

class ResultView: UICollectionReusableView {
        
    @IBOutlet weak var resultView: UILabel!
    @IBOutlet weak var trueView: UILabel!
    func setResult(with result:String,with trueAwe:String){
        resultView.text = result
        trueView.text = trueAwe
    }
    
}
