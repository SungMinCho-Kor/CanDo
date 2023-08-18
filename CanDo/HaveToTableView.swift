//
//  HaveToTableView.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/18.
//

import UIKit

class HaveToTableView:UITableView{
    let cellIdentifier = "myCell"
    var haveToList : [String] = []
    weak var parentViewController : TodayViewController?
    
    init(parentViewController : TodayViewController){
        super.init(frame: .zero, style: .plain)
        self.parentViewController = parentViewController
        self.frame = .zero
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addHaveToList(content : String){
        haveToList.append(content)
    }
    
    func setAttribute(){
        self.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        self.dataSource = self
        self.delegate = self
        self.allowsMultipleSelection = true
    }
}


extension HaveToTableView: UITableViewDelegate, UITableViewDataSource{
    
    //각 섹션 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haveToList.count
    }
    
    //section header text 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.text = "Have To"
        return header
    }
    
    //section header height 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
//    //section footer 설정
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = UIView()
//        return footer
//    }
//    //section footer height 설정
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 220
//    }
    
    
    //cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.cellLabel.text = haveToList[indexPath.row]
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .systemGray6
        cell.backgroundColor = .black
        return cell
    }
    
    //cell height 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //cell이 선택되면 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "할 일 수정", message: .none, preferredStyle: .alert)
        if indexPath.section == 0{
            alert.addTextField { (textField) in
                textField.placeholder = "할 일을 입력하세요."
                textField.text = self.haveToList[indexPath.row]
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                let text = alert.textFields?[0].text ?? ""
                if !text.isEmpty{
                    self.haveToList[indexPath.row] = text
                } else{
                    self.haveToList.remove(at: indexPath.row)
                }
                self.reloadData()
            }
            
            alert.addAction(ok)
        }
//        else{
//            alert.addTextField { (textField) in
//                textField.placeholder = "할 일을 입력하세요."
//                textField.text = self.optionList[indexPath.row]
//            }
//            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
//                let text = alert.textFields?[0].text ?? ""
//                if !text.isEmpty{
//                    self.optionList[indexPath.row] = text
//                } else{
//                    self.optionList.remove(at: indexPath.row)
//                }
//                self.tableView.reloadData()
//            }
//
//            alert.addAction(ok)
//        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        parentViewController!.present(alert, animated: true)
    }
    
}

