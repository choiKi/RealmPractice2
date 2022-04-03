//
//  ViewController.swift
//  RealmPractice2
//
//  Created by 최기훈 on 2022/04/03.
//

import UIKit
import Foundation
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        updateDB()
        
    }
    func addUser() {
        let user1 = UserDB()
        user1.id = 1
        user1.name = "최기훈"
        
        let user2 = UserDB()
        user2.id = 2
        user2.name = "최지오"
        
        let user3 = UserDB()
        user3.id = 3
        user3.name = "박슬기"
        
        let user4 = UserDB()
        user4.id = 4
        user4.name = "김주형"
        
        try! realm.write {
            realm.add(user1)
            realm.add(user2)
            realm.add(user3)
            realm.add(user4)
        }

    }
    
    func readDB() {
        let savedDB = realm.objects(UserDB.self)
        let filter = savedDB.filter("id == 2")
        print(filter)
    }
    
    func updateDB() {
        let savedDB = realm.objects(UserDB.self)
        let filter = savedDB.filter("name == '최지오'")
        
        try! realm.write{
            filter.first?.name = "최지호"
        }
    }
    
    func deleteDB(){
        let savedDB = realm.objects(UserDB.self)
        
        try! realm.write{
            realm.deleteAll()
        }
    }
    
    

}

class UserDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

