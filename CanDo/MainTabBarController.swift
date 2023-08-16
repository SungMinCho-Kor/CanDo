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
    let addButton = UIButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTodayTabNC()
        setCalendarTabNC()
        setAddButtonAttribute()
        
        setViewControllers([todayTabNC, calendarTabNC], animated: false)
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
    
    private func setAddButtonAttribute(){
        addButton.backgroundColor = .systemBlue
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.contentMode = .scaleAspectFit
        addButton.layer.cornerRadius = 30
        addButton.tintColor = .white
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addButton)
        addButton.centerXAnchor.constraint(equalTo:self.tabBar.safeAreaLayoutGuide.centerXAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: self.tabBar.safeAreaLayoutGuide.centerYAnchor, constant: -15).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        addButton.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
    }
    
    @objc
    func btnTap(){
        print("add Button Tap")
    }
    
}
