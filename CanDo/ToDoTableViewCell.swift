//
//  ToDoTableViewCell.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/14.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    var checkBoxButtonView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "checkmark.square")
        imageView.tintColor = .label
        return imageView
    }()
    
    let cellLabel = UILabel()
//    let cellIdentifier = "myCell"
    var isCheck: Bool = false {
        didSet {
            let imageName = isCheck ? "checkmark.square" : "checkmark.square.fill"
            checkBoxButtonView.image = UIImage(systemName: imageName)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder Error!!")
    }
    
    func setLayout(){
        
        
        self.contentView.addSubview(cellLabel)
        self.contentView.addSubview(checkBoxButtonView)
        
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: checkBoxButtonView.trailingAnchor, constant: 10).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        checkBoxButtonView.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        checkBoxButtonView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        checkBoxButtonView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkBoxButtonView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        checkBoxButtonView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    func setText(content : String){
        cellLabel.text = content
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isCheck.toggle()
    }
    
}
