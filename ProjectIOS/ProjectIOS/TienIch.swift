//
//  TienIch.swift
//  ProjectIOS
//
//  Created by Chuẩn Vũ Minh on 6/12/21.
//

import Foundation
class TienIch{
    
    //MARK:tạo câu hỏi lấy từ FireBase
    static func createCauHoi(_ value:NSDictionary) -> CauHoi {
        let cauHoiObj:CauHoi;
        let hinhAnh = value["hinhAnh"] as? String ?? "";

        let cauHoi = value["cauHoi"] as? String ?? "";

        let cauTraLoi = value["cauTraLoi"] as? [String] ?? [""];
        let dapAn = value["dapAn"] as? Int ?? 0;

        cauHoiObj = CauHoi(hinhAnh, cauHoi, cauTraLoi, dapAn);
        return cauHoiObj;
    }
    
    //MARK: lấy ngẫu nhiên câu hỏi theo từng loại đề
    public static func selectRandomElements(_ list:[CauHoi],_ amount:Int,_ start:Int,_ end:Int)->[CauHoi]{
        
        if(amount >= list.count){
            return list;
        }
        
        var selected:[CauHoi] = [];
        
        while (selected.count < amount) {
            var randomIndex:Int = -1;
            
            randomIndex = Int.random(in: (start-1)..<end);
            
            let element:CauHoi = list[randomIndex];
            
            if(!containCauHoi(element,selected)){
                selected += [element];
            }
        }
        
        return selected;
    }
    
    private static func containCauHoi(_ cauHoi:CauHoi,_ cauHois:[CauHoi])->Bool{
        var  result:Bool = false;
        
        for cauHoiItem in cauHois{
            if (cauHoiItem.cauHoi == cauHoi.cauHoi && cauHoiItem.dapAn == cauHoi.dapAn && cauHoiItem.cauTraLoi == cauHoi.cauTraLoi && cauHoiItem.hinhAnh == cauHoi.hinhAnh){
                result = true;
                break;
            }
        }
        return result;
    }
    
    
    //MARK: tạo mảng câu điểm liệt
    public static func RandomDeathPoints(_ n:Int,_ lengthCauHoi:Int) -> [Int]{
        var deathPoint:[Int] = [];
        while (deathPoint.count < n) {
            var randomIndex:Int = -1;
            randomIndex = Int.random(in: 0..<lengthCauHoi);
            
            if (!deathPoint.contains(where: {return $0 == randomIndex})) {
                deathPoint += [randomIndex]
            }
        }
        return deathPoint;
    }
    
    //MARK: kiểm tra kết quả đậu truợt
    public static func CheckResult(_ resultList:[Results],_ deathPoints:[Int],_ target:Int) -> String{
        var result:String = LoadScreenController.SUCESS;
        
        if(CountTrueChoseResult(resultList) < target){
            result = LoadScreenController.FAIL
        }
        
        for deathPoint in deathPoints {
            if(!resultList[deathPoint].resource){
                result = LoadScreenController.FAIL;
                break;
            }
        }
        
        return result;
    }
    
    //MARK: đếm số lượng câu hỏi đúng
    public static func CountTrueChoseResult(_ resultList:[Results])->Int{
        var count:Int = 0;
        
        for result in resultList {
            if (result.resource) {
                count += 1;
            }
        }
        
        return count
    }
    
    //MARK: chuyển số thành chuỗi 00:00
    public static func ChangeTimeToString(_ time:Int) -> String{
        var result:String = "";
        var strSeconds:String = "";
        var strMinutes:String = "";
        
        strSeconds = "\(time % 60)";
        strMinutes = "\(time / 60)";
        
        strSeconds = strSeconds.count == 1 ? ("0"+strSeconds) : strSeconds;
        strMinutes = strMinutes.count == 1 ? ("0"+strMinutes) : strMinutes;
        
        result = strMinutes + ":" + strSeconds;
        
        return result;
    }
    
    //MARK: chuyển chuỗi 00:00 thành số
    public static func ChangeStringToTime(_ str:String) -> Int{
        var result:Int = 0;
        
        let strs:[String] = str.components(separatedBy: [":"]);
        
        if let seconds = Int(strs[1]),let minutes = Int(strs[0])
        {
            result = (minutes * 60) + seconds;
        }
        
        return result;
    }
    
    //MARK: tạo ra mảng đáp án mặc định tất cả đều sai theo số lượng câu hỏi từng loại bằng
    public static func CreateResultsByCount(_ count:Int) -> [Results]{
        var results:[Results] = [];
        
        for i in 0..<count {
            results += [Results(i)];
        }
        
        return results;
    }
    
    //MARK: tạo ra mảng câu hỏi theo từng loại bằng lưu vào dataPassing
    public static func CreateCauHoisByLoaiBangToDataPassing(_ loaiBang:String)->Void{
        switch loaiBang {
        case ScreenMainController.data[0]:
            DataPassing.cauHois = FirebaseData.getRandomCauHoiBangA1();
            break;
        case ScreenMainController.data[1]:
            DataPassing.cauHois = FirebaseData.getRandomCauHoiBangA2();
            break;
            
        case ScreenMainController.data[3], ScreenMainController.data[2]:
            DataPassing.cauHois = FirebaseData.getRandomCauHoiBangA3_A4();
            break;
        case ScreenMainController.data[4]:
            DataPassing.cauHois = FirebaseData.getRandomCauHoiBangB1();
            break;
        case ScreenMainController.data[5],ScreenMainController.data[6],ScreenMainController.data[7],ScreenMainController.data[8],ScreenMainController.data[9]:
            DataPassing.cauHois = FirebaseData.getRandomCauHoiBangB2_C_D_E_F();
            break;
        default:
            break;
        }
    }
}
