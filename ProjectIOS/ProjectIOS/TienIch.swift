//
//  TienIch.swift
//  ProjectIOS
//
//  Created by Chuẩn Vũ Minh on 6/12/21.
//

import Foundation
class TienIch{
    static func createCauHoi(_ value:NSDictionary) -> CauHoi {
        let cauHoiObj:CauHoi;
        let hinhAnh = value["hinhAnh"] as? String ?? "";

        let cauHoi = value["cauHoi"] as? String ?? "";

        let cauTraLoi = value["cauTraLoi"] as? [String] ?? [""];
        let dapAn = value["dapAn"] as? Int ?? 0;

        cauHoiObj = CauHoi(hinhAnh, cauHoi, cauTraLoi, dapAn);
        return cauHoiObj;
    }
    
    public static func selectRandomElements(_ list:[CauHoi],_ amount:Int,_ start:Int,_ end:Int)->[CauHoi]{
        
        if(amount >= list.count){
            return list;
        }
        
        var selected:[CauHoi] = [];
        
        while (selected.count < amount) {
            var randomIndex:Int = -1;
            
            randomIndex = Int.random(in: start...end);
            
            let element:CauHoi = list[randomIndex];
            
            if(true){
                selected += [element];
            }
            
        }
        
        return selected;
    }
}
