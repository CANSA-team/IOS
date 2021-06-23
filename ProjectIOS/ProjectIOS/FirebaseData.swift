//
//  FirebaseData.swift
//  ProjectIOS
//
//  Created by Chuẩn Vũ Minh on 6/13/21.
//

import Foundation
class FirebaseData{
    //MARK: dữ liệu lưu lại khi lấy từ Firebase về
    public static var bangA1:[CauHoi] = [];
    public static var bangA2:[CauHoi] = [];
    public static var bangA3_A4:[CauHoi] = [];
    public static var bangB1:[CauHoi] = [];
    public static var bangB2_C_D_E_F:[CauHoi] = [];
    
    //MARK: lấy ngẫu nghiên câu hỏi theo SRS bằng A1
    public static func getRandomCauHoiBangA1()->[CauHoi]{
        var cauHoiBangA1:[CauHoi] = [];
        
        cauHoiBangA1 += TienIch.selectRandomElements(bangA1, 1, 1, 13);
        cauHoiBangA1 += TienIch.selectRandomElements(bangA1, 7, 14, 72);
        cauHoiBangA1 += TienIch.selectRandomElements(bangA1, 1, 73, 75);
        cauHoiBangA1 += TienIch.selectRandomElements(bangA1, 1, 76, 80);
        cauHoiBangA1 += TienIch.selectRandomElements(bangA1, 5, 81, 115);
        cauHoiBangA1 += TienIch.selectRandomElements(bangA1, 5, 116, 150);
        
        return cauHoiBangA1;
    }
    
    //MARK: lấy ngẫu nghiên câu hỏi theo SRS bằng A2
    public static func getRandomCauHoiBangA2()->[CauHoi]{
        var cauHoiBangA2:[CauHoi] = [];
        
        cauHoiBangA2 += TienIch.selectRandomElements(bangA2, 1, 1, 21);
        cauHoiBangA2 += TienIch.selectRandomElements(bangA2, 7, 22, 131);
        cauHoiBangA2 += TienIch.selectRandomElements(bangA2, 1, 132, 145);
        cauHoiBangA2 += TienIch.selectRandomElements(bangA2, 1, 146, 170);
        cauHoiBangA2 += TienIch.selectRandomElements(bangA2, 5, 171, 270);
        cauHoiBangA2 += TienIch.selectRandomElements(bangA2, 5, 271, 365);
        
        return cauHoiBangA2;
    }
    
    //MARK: lấy ngẫu nghiên câu hỏi theo SRS bằng A3_A4
    public static func getRandomCauHoiBangA3_A4()->[CauHoi]{
        var cauHoiBangA3_A4:[CauHoi] = [];
        
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 1, 1, 21);
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 7, 22, 131);
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 1, 132, 145);
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 1, 146, 175);
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 1, 176, 200);
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 5, 201, 300);
        cauHoiBangA3_A4 += TienIch.selectRandomElements(bangA3_A4, 4, 301, 390);
        
        return cauHoiBangA3_A4;
    }
    
    //MARK: lấy ngẫu nghiên câu hỏi theo SRS bằng B1
    public static func getRandomCauHoiBangB1()->[CauHoi]{
        var cauHoiBangB1:[CauHoi] = [];
        
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 1, 1, 21);
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 7, 22, 131);
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 1, 132, 145);
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 2, 146, 170);
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 1, 171, 225);
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 9, 226, 325);
        cauHoiBangB1 += TienIch.selectRandomElements(bangB1, 9, 326, 420);
        
        return cauHoiBangB1;
    }
    
    //MARK: lấy ngẫu nghiên câu hỏi theo SRS bằng B2_C_D_E_F
    public static func getRandomCauHoiBangB2_C_D_E_F()->[CauHoi]{
        var cauHoiBangB2_C_D_E_F:[CauHoi] = [];
        
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 1, 1, 21);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 7, 22, 131);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 1, 132, 145);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 1, 146, 175);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 1, 176, 200);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 1, 201, 255);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 9, 256, 355);
        cauHoiBangB2_C_D_E_F += TienIch.selectRandomElements(bangB2_C_D_E_F, 9, 356, 450);
        
        return cauHoiBangB2_C_D_E_F;
    }
}
