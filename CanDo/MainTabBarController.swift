//
//  MainTabBarController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let todayTab = TodayViewController(title: "Today", bgColor: .black)
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
        self.view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.backgroundColor = .systemBlue
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.contentMode = .scaleAspectFit
        addButton.layer.cornerRadius = 30
        addButton.tintColor = .white
        
        addButton.centerXAnchor.constraint(equalTo:self.tabBar.safeAreaLayoutGuide.centerXAnchor).isActive = true
        addButton.centerYAnchor.constraint(equalTo: self.tabBar.safeAreaLayoutGuide.centerYAnchor, constant: -15).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        addButton.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
    }
    
    @objc
    func btnTap(){
        let actionSheet = UIAlertController(title: "Have to? or Option?", message: .none, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "HaveTo", style: .default, handler: { (ACTION:UIAlertAction) in
            let alert = UIAlertController(title: "할 일 추가", message: .none, preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "할 일을 입력하세요."
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                let text = alert.textFields?[0].text ?? ""
                if !text.isEmpty{
                    self.todayTab.haveToTableView.list.append(text)
                    self.todayTab.haveToTableView.beginUpdates()
                    self.todayTab.haveToTableView.insertRows(at: [IndexPath(row: self.todayTab.haveToTableView.list.count - 1, section: 0)], with: .automatic)
                    self.todayTab.haveToTableView.endUpdates()
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Option", style: .default, handler: { (ACTION:UIAlertAction) in
            let alert = UIAlertController(title: "할 일 추가", message: .none, preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "할 일을 입력하세요."
            }
            let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                let text = alert.textFields?[0].text ?? ""
                if !text.isEmpty{
                    self.todayTab.optionTableView.list.append(text)
                    self.todayTab.optionTableView.beginUpdates()
                    self.todayTab.optionTableView.insertRows(at: [IndexPath(row: self.todayTab.optionTableView.list.count - 1, section: 0)], with: .automatic)
                    self.todayTab.optionTableView.endUpdates()
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(actionSheet, animated: true)
        
    }
    
}
