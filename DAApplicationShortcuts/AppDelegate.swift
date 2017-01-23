//
//  AppDelegate.swift
//  DAApplicationShortcuts
//
//  Created by Dejan on 23/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var shortcutManager: ShortcutManagable = ShortcutManager()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if self.checkIfForceTouchIsAvailable() == true {
            
            UIApplication.shared.shortcutItems = self.shortcutManager.applicationShortcuts()
        }
        
        return true
    }
    
    public func applicationWillEnterForeground(_ application: UIApplication) {
        _ = self.checkIfForceTouchIsAvailable()
    }
    
    public func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        self.displayAlert(withShortcut: shortcutItem)
        
        self.shortcutManager.processShortcutItem(shortcutItem: shortcutItem)
        
        completionHandler(true)
    }
}


private extension AppDelegate {
    
    func displayAlert(withShortcut shortcutItem: UIApplicationShortcutItem) {
        
        let alert = UIAlertController.init(title: "Shortcut title: \(shortcutItem.localizedTitle)",
            message: "Shortcut type: \(shortcutItem.type) \n Shortcut subtitle: \(shortcutItem.localizedSubtitle ?? "")",
            preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(dismissAction)
        
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func checkIfForceTouchIsAvailable() -> Bool {
        
        if self.window?.traitCollection.forceTouchCapability != .available {
            let alert = UIAlertController.init(title: "3D touch is only supported by iPhone 6s or 6s Plus and later",
                                               message: "This example won't work if you have a lower device or have disabled 3D touch.",
                                               preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismissAction)
            
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
    }
}

