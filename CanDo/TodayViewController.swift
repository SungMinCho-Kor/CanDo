//
//  todayViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class TodayViewController: UIViewController {
    
    var haveToTableView: TableView!
    var optionTableView: TableView!
    let cellIdentifier = "myCell"
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
        setAttribute()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func setAttribute(){
        haveToTableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        optionTableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        haveToTableView.dataSource = self
        haveToTableView.delegate = self
        haveToTableView.allowsMultipleSelection = true
        optionTableView.dataSource = self
        optionTableView.delegate = self
        optionTableView.allowsMultipleSelection = true
    }
    
    
    private func configureTableView() {
        haveToTableView = TableView(tableTitle: "HaveTo")
        self.view.addSubview(haveToTableView)
        haveToTableView.translatesAutoresizingMaskIntoConstraints = false
        
        haveToTableView.layer.cornerRadius = 10
        haveToTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        haveToTableView.heightAnchor.constraint(equalToConstant: self.view.safeAreaLayoutGuide.layoutFrame.height * 0.4).isActive = true
        haveToTableView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        haveToTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        haveToTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        
        haveToTableView.backgroundColor = .black
        haveToTableView.tintColor = .white
        haveToTableView.separatorColor = .clear
        haveToTableView.layer.cornerRadius = 20
        
        
        optionTableView = TableView(tableTitle: "Option")
        self.view.addSubview(optionTableView)
        optionTableView.translatesAutoresizingMaskIntoConstraints = false
        
        optionTableView.layer.cornerRadius = 10
        optionTableView.topAnchor.constraint(equalTo: haveToTableView.bottomAnchor, constant: 10).isActive = true
        optionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        optionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        optionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        
        optionTableView.backgroundColor = .black
        optionTableView.tintColor = .white
        optionTableView.separatorColor = .clear
        optionTableView.layer.cornerRadius = 20
        
    }
    
}


extension TodayViewController: UITableViewDelegate, UITableViewDataSource{
    
    //각 섹션 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == haveToTableView{
            return haveToTableView.list.count
        } else {
            return optionTableView.list.count
        }
    }
    
    //section header text 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let header = UILabel()
        headerView.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.heightAnchor.constraint(equalToConstant: 30).isActive = true
        header.widthAnchor.constraint(equalToConstant: 70).isActive = true
        header.textAlignment = .center
        header.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        
        header.layer.borderWidth = 1
        header.layer.borderColor = UIColor.systemGray6.cgColor
        header.layer.cornerRadius = 10
        header.layer.backgroundColor = UIColor.systemBlue.cgColor
        if tableView == haveToTableView{
            header.text = haveToTableView.tableTitle
        } else{
            header.text = optionTableView.tableTitle
        }
        return headerView
    }
    
    //section header height 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    //cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        if tableView == haveToTableView{
            cell.configure(element: haveToTableView.list[indexPath.row])
        } else{
            cell.configure(element: optionTableView.list[indexPath.row])
        }
        cell.indexPath = indexPath
        cell.delegate = self
        
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .gray
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
        
        alert.addTextField { (textField) in
            textField.placeholder = "할 일을 입력하세요."
            if tableView == self.haveToTableView{
                textField.text = self.haveToTableView.list[indexPath.row].text
            } else{
                textField.text = self.optionTableView.list[indexPath.row].text
            }
        }
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            let text = alert.textFields?[0].text ?? ""
            if !text.isEmpty{
                if tableView == self.haveToTableView{
                    self.haveToTableView.list[indexPath.row].text = text
                } else{
                    self.optionTableView.list[indexPath.row].text = text
                }
                tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
            } else{
                if tableView == self.haveToTableView{
                    self.haveToTableView.list.remove(at: indexPath.row)
                } else{
                    self.optionTableView.list.remove(at: indexPath.row)
                }
                tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
            }
        }
        alert.addAction(ok)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    //cell 오른쪽에서 드래그하면 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if tableView == self.haveToTableView{
                self.haveToTableView.list.remove(at: indexPath.row)
            } else{
                self.optionTableView.list.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        }
    }
}


extension TodayViewController:TableViewCellDelegate{
    func tableViewCellCheckBoxDidTap(indexPath: IndexPath) {
        
    }
    
    func tableViewCellCheckBoxDidTap(tableView: UITableView, indexPath: IndexPath) {
        if tableView == haveToTableView{
            haveToTableView.list[indexPath.row].isCheck.toggle()
        } else{
            optionTableView.list[indexPath.row].isCheck.toggle()
        }
        tableView.reloadRows(at: [indexPath], with: .automatic )
    }
}
