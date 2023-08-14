//
//  ToDoTableViewCell.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/14.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    let cellLabel = UILabel()
    let cellIdentifier = "myCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder Error!!")
    }
    
    func setLayout(){
        self.addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
}
