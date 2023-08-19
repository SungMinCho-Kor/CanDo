//
//  TableView.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/18.
//

import UIKit

class TableView:UITableView{
    let cellIdentifier = "myCell"
    var list : [String] = ["1","2","3","4","5","6","7"]
    let tableTitle : String
    
    weak var parentViewController : TodayViewController?
    
    init(parentViewController : TodayViewController, tableTitle: String){
        self.tableTitle = tableTitle
        super.init(frame: .zero, style: .plain)
        self.parentViewController = parentViewController
        self.frame = .zero
    }
    
    required init?(coder: NSCoder) {
        self.tableTitle = ""
        super.init(coder: coder)
    }
    
    func setAttribute(){
        self.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.dataSource = self
        self.delegate = self
        self.allowsMultipleSelection = true
    }
}


extension TableView: UITableViewDelegate, UITableViewDataSource{
    
    //각 섹션 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    //section header text 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.text = self.tableTitle
        return header
    }
    
    //section header height 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    //cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.cellLabel.text = list[indexPath.row]
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
                textField.text = self.list[indexPath.row]
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                let text = alert.textFields?[0].text ?? ""
                if !text.isEmpty{
                    self.list[indexPath.row] = text
                    self.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
                } else{
                    self.list.remove(at: indexPath.row)
                    self.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
                }
            }
            
            alert.addAction(ok)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        parentViewController!.present(alert, animated: true)
    }
    
    //cell 오른쪽에서 드래그하면 삭제
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.list.remove(at: indexPath.row)
            self.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        }
    }
    
}
