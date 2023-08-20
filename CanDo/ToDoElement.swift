//
//  ToDoListData.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/17.
//

import Foundation

struct ToDoElement{
    var text : String
    var isCheck : Bool
    var isHaveTo : Bool
    
    init(text: String, isHaveTo: Bool) {
        self.text = text
        self.isCheck = false
        self.isHaveTo = isHaveTo
    }
}
