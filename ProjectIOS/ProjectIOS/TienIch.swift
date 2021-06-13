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
            
            if(!selected.contains(where: {
                return ($0.cauHoi == element.cauHoi||$0.dapAn == element.dapAn || $0.cauTraLoi == element.cauTraLoi || $0.hinhAnh == element.hinhAnh)
            })){
                selected += [element];
            }
        }
        
        return selected;
    }
    
    public static func RandomDeathPoints(_ n:Int,_ lengthCauHoi:Int) -> [Int]{
        var deathPoint:[Int] = [];
        while (deathPoint.count < n) {
            var randomIndex:Int = -1;
            randomIndex = Int.random(in: 0...lengthCauHoi);
            
            if (!deathPoint.contains(where: {return $0 == randomIndex})) {
                deathPoint += [randomIndex]
            }
        }
        return deathPoint;
    }
    
    public static func CheckResult(_ resultList:[Results],_ deathPoints:[Int],_ target:Int) -> Bool{
        var result:Bool = true;
        
        if(CountTrueChoseResult(resultList) < target){
            result = false
        }
        
        for deathPoint in deathPoints {
            if(!resultList[deathPoint].resource){
                result = false;
                break;
            }
        }
        
        return result;
    }
    
    public static func CountTrueChoseResult(_ resultList:[Results])->Int{
        var count:Int = 0;
        
        for result in resultList {
            if (result.resource) {
                count += 1;
            }
        }
        
        return count
    }
    
    public static func ChangeTimeToString(_ time:Int) -> String{
        var result:String = "";
        var strSeconds:String = "";
        var strMinutes:String = "";
        
        strSeconds = "\(time % 60)";
        strMinutes = "\(time / 60)";
        
        strSeconds = strSeconds.count == 1 ? ("0"+strSeconds) : strSeconds;
        strMinutes = strMinutes.count == 1 ? ("0"+strMinutes) : strMinutes;
        
        result = strMinutes + strSeconds;
        
        return result;
    }
    
    public static func ChangeStringToTime(_ str:String) -> Int{
        var result:Int = 0;
        var seconds:Int = 0;
        var minutes:Int = 0;
        
        let strs:[String] = str.components(separatedBy: [":"]);
        
        seconds = strs[1] as! Int;
        minutes = strs[2] as! Int;
        
        result = minutes + seconds;
        
        return result;
    }
}
