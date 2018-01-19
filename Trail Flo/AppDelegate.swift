//
//  AppDelegate.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            if try Realm().isEmpty {
                User().save(with: "admin", password: "123")
            }
        } catch {
            print("Appdelegate - Something went wrong !!!")
        }
        
        return true
    }
}

