//
//  ToDoTableViewCell.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/14.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    var checkBoxButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let cellLabel = UILabel()
    var isCheck: Bool = false {
        didSet {
            let imageName = !isCheck ? "checkmark.square" : "checkmark.square.fill"
            checkBoxButton.setImage(UIImage(systemName: imageName),for: .normal)
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
        self.contentView.addSubview(checkBoxButton)
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 20).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        checkBoxButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        checkBoxButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkBoxButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        checkBoxButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        checkBoxButton.addTarget(self, action: #selector(checkBoxTap), for: .touchUpInside)
    }
    
    @objc
    func checkBoxTap(){
        isCheck.toggle()
    }
    
    func setText(content : String){
        cellLabel.text = content
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //cell 클릭시 실행
    }
    
}
