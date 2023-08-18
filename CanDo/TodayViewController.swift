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
    }
    
    
    private func configureTableView() {
        haveToTableView = TableView(parentViewController: self,tableTitle: "HaveTo")
        haveToTableView.setAttribute()
        
        haveToTableView.layer.cornerRadius = 10
        haveToTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(haveToTableView)
        haveToTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        haveToTableView.heightAnchor.constraint(equalToConstant: self.view.safeAreaLayoutGuide.layoutFrame.height * 0.4).isActive = true
        haveToTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        haveToTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        
        haveToTableView.backgroundColor = .black
        haveToTableView.tintColor = .white
        haveToTableView.separatorColor = .clear
        haveToTableView.layer.cornerRadius = 20
        
        
        optionTableView = TableView(parentViewController: self,tableTitle: "Option")
        optionTableView.setAttribute()
        
        optionTableView.layer.cornerRadius = 10
        optionTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(optionTableView)
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
