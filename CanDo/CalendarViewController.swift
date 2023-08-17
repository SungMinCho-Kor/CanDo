//
//  CalendarViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class CalendarViewController: UIViewController {
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

