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
    var todoList : [String] = ["집 청소", "공부하기", "샤워하기"]
    
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
    
    //cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ToDoTableViewCell
        cell.cellLabel.text = todoList[indexPath.row]
        return cell
    }
    
    //cell이 선택되면 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ToDoTableViewCell
//        cell.isCheck.toggle()
    }
    
    
}

