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
    }
}

extension ToDoTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = todoList[indexPath.row]
        cellContent.image = UIImage(systemName: "checkmark.square")
        cell.contentConfiguration = cellContent
        return cell
    }
    
    
}

