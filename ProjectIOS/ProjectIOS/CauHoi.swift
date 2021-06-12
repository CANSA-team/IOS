//
//  CauHoi.swift
//  ProjectIOS
//
//  Created by Vu Minh Chuan on 4/16/21.
//

import Foundation
class CauHoi {
    var hinhAnh:String = "hinhAnh"
    var cauHoi:String = "cauHoi"
    var cauTraLoi:[String] = ["cauTraLoi"]
    var dapAn:Int = 0
    init() {
        
    }
    init(_ hinhAnh:String,_ cauHoi:String,_ cauTraLoi:[String],_ dapAn:Int){
        self.hinhAnh = hinhAnh;
        self.cauHoi = cauHoi;
        self.cauTraLoi = cauTraLoi;
        self.dapAn = dapAn;
    }
    
    func getHinhAnh() -> String {
        return self.hinhAnh;
    }
    
    func setHinhAnh(_ hinhAnh:String) -> Void {
        self.hinhAnh = hinhAnh;
    }
    
    func getCauTraLoi() -> [String] {
        return self.cauTraLoi;
    }
    
    func setCauTraLoi(_ cauTraLoi:[String]) -> Void {
        self.cauTraLoi = cauTraLoi;
    }
    
    func getCauHoi() -> String {
        return self.cauHoi;
    }
    
    func setCauHoi(_ cauHoi:String) -> Void {
        self.cauHoi = cauHoi;
    }
    
    func getDapAn() -> Int {
        return self.dapAn;
    }
    
    func setDapAn(_ dapAn:Int) -> Void {
        self.dapAn = dapAn;
    }
}
