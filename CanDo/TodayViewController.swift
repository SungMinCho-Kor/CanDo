//
//  todayViewController.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/13.
//

import UIKit
import SnapKit
import CoreData

class TodayViewController: UIViewController {
    
    var haveToTableView: TableView!
    var optionTableView: TableView!
    let cellIdentifier = "myCell"
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
        setAttribute()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    //CoreData 쓰기
    func saveCoreData(text: String, isCheck: Bool, isHaveTo: Bool) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "DayList", in: managedContext)!
        let object = NSManagedObject(entity: entity, insertInto: managedContext)
        
        object.setValue(text, forKey: "text")
        object.setValue(isCheck, forKey: "isCheck")
        object.setValue(isHaveTo, forKey: "isHaveTo")
        
        do {
            try managedContext.save()
            return true
        } catch let error as NSError{
            print("Save Fail. \(error) \(error.userInfo)")
            return false
        }
    }
    
    func readCoreData() throws -> [NSManagedObject]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Entity의 fetchRequest 생성
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "DayList")
        
        // 정렬 또는 조건 설정
        //    let sort = NSSortDescriptor(key: "createDate", ascending: false)
        //    fetchRequest.sortDescriptors = [sort]
        //    fetchRequest.predicate = NSPredicate(format: "isFinished = %@", NSNumber(value: isFinished))
        
        do {
            // fetchRequest를 통해 managedContext로부터 결과 배열을 가져오기
            let resultCDArray = try managedContext.fetch(fetchRequest)
            return resultCDArray
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            throw error
        }
    }
    
    
    
    func setAttribute(){
        haveToTableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        haveToTableView.dataSource = self
        haveToTableView.delegate = self
        haveToTableView.allowsMultipleSelection = true
        
        optionTableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        optionTableView.dataSource = self
        optionTableView.delegate = self
        optionTableView.allowsMultipleSelection = true
    }
    
    private func configureTableView() {
        haveToTableView = TableView(tableTitle: "HaveTo")
        optionTableView = TableView(tableTitle: "Option")
        self.view.addSubview(haveToTableView)
        self.view.addSubview(optionTableView)
        
        haveToTableView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(view).multipliedBy(0.5)
        }
        haveToTableView.backgroundColor = .black
        haveToTableView.tintColor = .white
        haveToTableView.separatorColor = .clear
        haveToTableView.layer.cornerRadius = 20
        
        optionTableView.snp.makeConstraints { make in
            make.top.equalTo(haveToTableView.snp.bottom)
            make.leading.bottom.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        optionTableView.backgroundColor = .black
        optionTableView.tintColor = .white
        optionTableView.separatorColor = .clear
        optionTableView.layer.cornerRadius = 20
        
    }
}


extension TodayViewController: UITableViewDelegate, UITableViewDataSource{
    
    //각 섹션 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == haveToTableView{
            return haveToTableView.list.count
        } else {
            return optionTableView.list.count
        }
    }
    
    //section header text 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let header = UILabel()
        headerView.addSubview(header)
        header.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(70)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        
        header.textAlignment = .center
        header.layer.borderWidth = 1
        header.layer.borderColor = UIColor.darkGray.cgColor
        header.layer.cornerRadius = 10
        header.layer.backgroundColor = UIColor.darkGray.cgColor
        
        if tableView == haveToTableView{
            header.text = haveToTableView.tableTitle
        } else{
            header.text = optionTableView.tableTitle
        }
        
        return headerView
    }
    
    //section header height 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    //cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.indexPath = indexPath
        if tableView == haveToTableView{
            cell.configure(element: haveToTableView.list[indexPath.row])
            cell.delegate = haveToTableView
        } else{
            cell.configure(element: optionTableView.list[indexPath.row])
            cell.delegate = optionTableView
        }
        
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .gray
        cell.backgroundColor = .black
        return cell
    }
    
    //cell height 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //cell이 선택되면 실행
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "할 일 수정", message: .none, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "할 일을 입력하세요."
            if tableView == self.haveToTableView{
                textField.text = self.haveToTableView.list[indexPath.row].text
            } else{
                textField.text = self.optionTableView.list[indexPath.row].text
            }
        }
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            let text = alert.textFields?[0].text ?? ""
            if !text.isEmpty{
                if tableView == self.haveToTableView{
                    self.haveToTableView.list[indexPath.row].text = text
                } else{
                    self.optionTableView.list[indexPath.row].text = text
                }
                tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
            } else{
                if tableView == self.haveToTableView{
                    self.haveToTableView.list.remove(at: indexPath.row)
                } else{
                    self.optionTableView.list.remove(at: indexPath.row)
                }
                tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
            }
        }
        alert.addAction(ok)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
        }
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    //cell 오른쪽에서 드래그하면 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if tableView == self.haveToTableView{
                self.haveToTableView.list.remove(at: indexPath.row)
            } else{
                self.optionTableView.list.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .left)
        }
    }
}
