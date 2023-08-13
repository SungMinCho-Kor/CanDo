//
//  MainTabBarController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let todayTab = ToDoTableViewController(title: "Today", bgColor: .black)
    let calendarTab = CalendarViewController(title: "Calendar", bgColor: .black)
    var todayTabNC = MainNavigationController()
    var calendarTabNC = MainNavigationController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTodayTabNC()
        setCalendarTabNC()
        
        self.viewControllers = [todayTabNC, calendarTabNC]
    }
    
    private func setTodayTabNC(){
        todayTab.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        todayTabNC = MainNavigationController(rootViewController: todayTab)
    }
    
    private func setCalendarTabNC(){
        calendarTab.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        calendarTabNC = MainNavigationController(rootViewController: calendarTab)
    }
    
    private func setTabBar(){
        tabBar.backgroundColor = .darkGray
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
    }
    
}
