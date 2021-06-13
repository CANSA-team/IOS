//
//  DataPassing.swift
//  ProjectIOS
//
//  Created by Hoàng anh on 5/28/21.
// File này dùng để làm tài nguyên dữ liệu cho toàn các controller 
// Cách sử dung DataPassing.shared. dữ liệu cần lấy
//

import Foundation
import UIKit
class DataPassing{
    static let shared = DataPassing()
    var loaiBang:String? // Đây là file để trans data giữa main và QuestionController
    var allButtons = [UIButton]() // Đây là các nút button của các câu hỏi
    var collectionView:UICollectionView? //Cái này có thể sử dụng để lưu các dữ liệu của collectionView như kích thước bla bla
    var count = 0 //Cái này để làm đếm trung gian 
    
}

