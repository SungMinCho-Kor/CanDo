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
    var haveTo : Bool
    
    init(text: String) {
        self.text = text
        self.isCheck = false
        self.haveTo = false
    }
}

class ToDoListData{
    
    var todoList : [ToDoElement] = []
    
    func add(content : String){
        todoList.append(ToDoElement(text: content))
    }
    
}
