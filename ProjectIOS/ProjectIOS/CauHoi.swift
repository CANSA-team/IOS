//
//  CauHoi.swift
//  ProjectIOS
//
//  Created by Vu Minh Chuan on 4/16/21.
//

import Foundation
class CauHoi {
    private var hinhAnh:HinhAnh{
        get{
            return self.hinhAnh;
        }
        set{
            self.hinhAnh = newValue;
        }
    };
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
    private var dapAn:Int{
        get{
            return self.dapAn;
        }
        set{
            self.dapAn = newValue;
        }
    };
    init(){
    }
    init(_ hinhAnh:HinhAnh,_ cauHoi:String,_ cauTraLoi:Array<String>,_ dapAn:Int){
        self.hinhAnh = hinhAnh;
        self.cauHoi = cauHoi;
        self.cauTraLoi = cauTraLoi;
        self.dapAn = dapAn;
    }
    
}
