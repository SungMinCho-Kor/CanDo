//
//  MainNavigationController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNivagationBar()
    }
    
    
    private func setNivagationBar(){
//        navigationBar.backgroundColor = .black
//        navigationBar.tintColor = .white
//        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationBar.barStyle = .black
    }
}
