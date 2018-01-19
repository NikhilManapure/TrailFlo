//
//  User.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import UIKit
import RealmSwift

class User: Object {
    
    dynamic var userName: String = ""
    dynamic var password: String = ""

    override class func primaryKey() -> String? {
        return "userName"
    }
    
    override class func ignoredProperties() -> [String] {
        return []
    }
    
    func save(with userName: String, password: String) {
        do {
            let realm = try Realm()
            try realm.write() {
                self.userName = userName
                self.password = password
                realm.add(self, update: true)
            }
        } catch {
            print("User.update - Something went wrong !!!")
        }
    }
    
    static var all: [User] {
        get {
            do {
                let realm = try Realm()
                return Array(realm.objects(User.self).sorted(byKeyPath: "userName", ascending: false))
            } catch {
                print("User.all - Something went wrong !!!")
            }
            return []
        }
    }
    
    func delete() {
        do {
            let realm = try Realm()
            try realm.write() {
                realm.delete(self)
            }
        } catch {
            print("User.delete - Something went wrong !!!")
        }
    }
}
