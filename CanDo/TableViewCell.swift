//
//  ToDoTableViewCell.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/14.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
    var indexPath: IndexPath?
    let cellLabel = UILabel()
    
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
        
        cellLabel.snp.makeConstraints { make in
            make.leading.equalTo(checkBoxButton.snp.trailing).offset(10)
            make.trailing.top.bottom.equalToSuperview()
        }
        checkBoxButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.height.width.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
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
