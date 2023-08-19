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
        navigationBar.barStyle = .black
        navigationBar.backgroundColor = .black
    }
}
