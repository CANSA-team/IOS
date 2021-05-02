//
//  HinhAnh.swift
//  ProjectIOS
//
//  Created by Vu Minh Chuan on 4/16/21.
//

import Foundation
class HinhAnh {
    private var link:String{
        get{
            return self.link;
        }
        set{
            self.link = newValue;
        }
    };
    private var name:String{
        get{
            return self.name;
        }
        set{
            self.name = newValue;
        }
    };
    init(){
    }
    init(_ link:String,_ name:String){
        self.link = link;
        self.name = name;
    }
    
}
