//  đối tượng kết quả
//  Results.swift
//  ProjectIOS
//
//  Created by Chuẩn Vũ Minh on 6/13/21.
//

import Foundation
class Results{
    var answeredIndex:Int = 0;
    var resource:Bool = false;
    var choses:Int = 0;
    
    init(_ answeredIndex:Int) {
        self.answeredIndex = answeredIndex
        
    }
    init(_ answeredIndex:Int,resource:Bool,choses:Int) {
        self.answeredIndex = answeredIndex;
        self.choses = choses;
        self.resource = resource;
    }
}
