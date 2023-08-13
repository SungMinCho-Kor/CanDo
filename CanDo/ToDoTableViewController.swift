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
    }
    
    private func configureTableView() {
           toDoTableView = UITableView()
           toDoTableView.translatesAutoresizingMaskIntoConstraints = false
           self.view.addSubview(toDoTableView)
           toDoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
           toDoTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
           toDoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
           toDoTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
           
           toDoTableView.backgroundColor = .white
           toDoTableView.tintColor = .blue
           toDoTableView.separatorColor = .darkGray
       }
}

