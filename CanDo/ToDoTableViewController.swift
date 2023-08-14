//
//  todayViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class ToDoTableViewController: UIViewController {
    
    private var toDoTableView: UITableView!

    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        setDelegate()
        
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
    
    private func setDelegate(){
        self.toDoTableView.dataSource = self
        self.toDoTableView.delegate = self
    }
}

extension ToDoTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = "\(indexPath.row)"
        cellContent.image = UIImage(systemName: "checkmark.square")
        cell.contentConfiguration = cellContent
        return cell
    }
    
    
}

