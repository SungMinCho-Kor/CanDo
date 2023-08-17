//
//  todayViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class ToDoTableViewController: UIViewController {
    
    private var toDoTableView: UITableView!
    let cellIdentifier = "myCell"
    var todoList : [String] = []
    
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
        toDoTableView.reloadData()
    }
    
    
    private func configureTableView() {
        toDoTableView = UITableView(frame: .zero, style: .insetGrouped)
        toDoTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(toDoTableView)
        toDoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        toDoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        toDoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        toDoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        toDoTableView.backgroundColor = .white
        toDoTableView.tintColor = .blue
        toDoTableView.separatorColor = .darkGray
        toDoTableView.separatorInset = .zero
        
    }
    
    private func setAttribute(){
        self.toDoTableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.toDoTableView.dataSource = self
        self.toDoTableView.delegate = self
        
        self.toDoTableView.allowsMultipleSelection = true
    }
}

extension ToDoTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    //각 섹션 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    //section 개수 설정
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ToDoTableViewCell
        cell.cellLabel.text = todoList[indexPath.row]
        cell.selectionStyle = .none
//        cell.contentView.layer.borderWidth = 1
        return cell
    }
    
    //cell이 선택되면 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected #\(todoList[indexPath.row])")
        
        let alert = UIAlertController(title: "할 일 수정", message: .none, preferredStyle: .alert)
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
            self.toDoTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

