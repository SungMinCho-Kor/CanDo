//
//  TableView.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/18.
//

import UIKit

protocol TableViewCellDelegate: AnyObject{
    func tableViewCellCheckBoxDidTap(indexPath : IndexPath)
}
class TableView:UITableView{
    let cellIdentifier = "myCell"
    var list : [ToDoElement] = []
    let tableTitle : String
    
    init(tableTitle: String){
        self.tableTitle = tableTitle
        super.init(frame: .zero, style: .plain)
        self.frame = .zero
    }
    
    required init?(coder: NSCoder) {
        self.tableTitle = ""
        super.init(coder: coder)
    }
}

extension TableView:TableViewCellDelegate{
    func tableViewCellCheckBoxDidTap(indexPath: IndexPath) {
        self.list[indexPath.row].isCheck.toggle()
        self.reloadRows(at: [indexPath], with: .automatic)
    }
}
