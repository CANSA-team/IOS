//
//  CauHoiData.swift
//  ProjectIOS
//
//  Created by intozoom on 6/12/21.
//

import Foundation

class CauHoiData {
    private var cauHoi:String{
        get{
            return self.cauHoi;
        }
        set{
            self.cauHoi = newValue;
        }
    };
    private var cauTraLoi:Array<String>{
        get{
            return self.cauTraLoi;
        }
        set{
            self.cauTraLoi = newValue;
        }
    };
    init(){
    }
    init(_ cauHoi:String,_ cauTraLoi:Array<String>){
        self.cauHoi = cauHoi;
        self.cauTraLoi = cauTraLoi;
    }
}
