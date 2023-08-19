//
//  ToDoTableViewCell.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/14.
//

import UIKit


protocol TableViewCellDelegate: AnyObject{
    func tableViewCellCheckBoxDidTap(indexPath : IndexPath)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
    var indexPath: IndexPath?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        indexPath = nil
        delegate = nil
    }
    
    var checkBoxButton : UIButton = {
        let btn = UIButton()
        var image = UIImage(systemName: "checkmark.square")?.resized(to: CGSize(width: 25, height: 25)).withTintColor(.white)
        btn.backgroundColor = .clear
        btn.setImage(image, for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let cellLabel = UILabel()
    
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
        checkBoxButton.contentMode = .scaleAspectFit
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 20).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellLabel.textColor = .white
        
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        checkBoxButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        checkBoxButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        checkBoxButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        checkBoxButton.addTarget(self, action: #selector(checkBoxTap), for: .touchUpInside)
        
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.systemGray3.cgColor
    }
    
    @objc
    func checkBoxTap(){
        guard let indexPath else{ return }
        self.delegate?.tableViewCellCheckBoxDidTap(indexPath: indexPath)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //cell 클릭시 실행
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    func configure(element: ToDoElement){
        cellLabel.text = element.text
        
        let imageName = !element.isCheck ? "checkmark.square" : "checkmark.square.fill"
        checkBoxButton.setImage(UIImage(systemName: imageName)?.resized(to: CGSize(width: 25, height: 25)).withTintColor(.white),for: .normal)
    }
}


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
