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
        let appearnace = UINavigationBarAppearance()
        appearnace.backgroundColor = .black
        appearnace.titleTextAttributes = [.foregroundColor : UIColor.white]
//        navigationBar.barStyle = .black
//        navigationBar.backgroundColor = .black
        self.navigationBar.standardAppearance = appearnace
        self.navigationBar.scrollEdgeAppearance = appearnace
    }
}
