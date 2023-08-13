//
//  ViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/09.
//

import UIKit

class MyViewController: UIViewController {
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

