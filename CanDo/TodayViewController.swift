//
//  todayViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class TodayViewController: UIViewController {
    
    private var tableView: UITableView!
    let cellIdentifier = "myCell"
    var todoList : [String] = []
    var optionList : [String] = []
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        setAttribute()
    }
    
    func addToDoList(content : String){
        todoList.append(content)
        tableView.reloadData()
    }
    
    func addOptionList(content : String){
        optionList.append(content)
        tableView.reloadData()
    }
    
    
    private func configureTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        tableView.layer.cornerRadius = 10
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        tableView.backgroundColor = .white
        tableView.tintColor = .black
        tableView.separatorColor = .darkGray
        tableView.separatorInset = .zero
        
    }
    
    private func setAttribute(){
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.allowsMultipleSelection = true
    }
}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource{
    
    //각 섹션 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return todoList.count
        } else {
            return optionList.count
        }
    }
    
    //section 수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //section header 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        if section == 0{
            header.text = "Have To"
        }else{
            header.text = "Options"
        }
        return header
    }
    
    //cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        if indexPath.section == 0{
            cell.cellLabel.text = todoList[indexPath.row]
        } else{
            cell.cellLabel.text = optionList[indexPath.row]
        }
        cell.selectionStyle = .none
//        cell.contentView.layer.borderWidth = 1.2
        return cell
    }
    
    //cell이 선택되면 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "할 일 수정", message: .none, preferredStyle: .alert)
        if indexPath.section == 0{
            alert.addTextField { (textField) in
                textField.placeholder = "할 일을 입력하세요."
                textField.text = self.todoList[indexPath.row]
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                let text = alert.textFields?[0].text ?? ""
                if !text.isEmpty{
                    self.todoList[indexPath.row] = text
                } else{
                    self.todoList.remove(at: indexPath.row)
                }
                self.tableView.reloadData()
            }
            
            alert.addAction(ok)
        }else{
            alert.addTextField { (textField) in
                textField.placeholder = "할 일을 입력하세요."
                textField.text = self.optionList[indexPath.row]
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                let text = alert.textFields?[0].text ?? ""
                if !text.isEmpty{
                    self.optionList[indexPath.row] = text
                } else{
                    self.optionList.remove(at: indexPath.row)
                }
                self.tableView.reloadData()
            }
            
            alert.addAction(ok)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}

