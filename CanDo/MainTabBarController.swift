//
//  MainTabBarController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        
        let todayTab = TodayViewController(title: "Today", bgColor: .black)
        todayTab.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        let todayTabNC = MainNavigationController(rootViewController: todayTab)
        

        let calendarTab = CalendarViewController(title: "Calendar", bgColor: .black)
        calendarTab.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        
        let calendarTabNC = MainNavigationController(rootViewController: calendarTab)
        
        self.viewControllers = [todayTabNC, calendarTabNC]
    }
    
    private func setTabBar(){
        tabBar.backgroundColor = .darkGray
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
    }
    
}
