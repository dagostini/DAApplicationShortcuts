//
//  ShortcutManager.swift
//  DAApplicationShortcuts
//
//  Created by Dejan on 23/01/2017.
//  Copyright © 2017 Dejan. All rights reserved.
//

import UIKit


private enum ApplicationShortcutItem: String {
    
    case Item1
    case Item2
    case Item3
    case Item4
    
    var title: String {
        get {
            switch self {
            case .Item1: return "Item Title 1"
            case .Item2: return "Item Title 2"
            case .Item3: return "Item Title 3"
            case .Item4: return "Item Title 4"
            }
        }
    }
    
    var subtitle: String? {
        get {
            switch self {
            case .Item1: return "Item 1 subtitle"
            case .Item3: return "Item 3 subtitle"
            default: return nil
            }
        }
    }
    
    var icon: UIApplicationShortcutIcon? {
        get {
            return nil
        }
    }
}


public protocol ShortcutManagable {
    func applicationShortcuts() -> [UIApplicationShortcutItem]
    func processShortcutItem(shortcutItem: UIApplicationShortcutItem)
}


class ShortcutManager: ShortcutManagable {
    
    func applicationShortcuts() -> [UIApplicationShortcutItem] {
        return [ApplicationShortcutItem.Item1,
                ApplicationShortcutItem.Item2,
                ApplicationShortcutItem.Item3,
                ApplicationShortcutItem.Item4]
            .map { UIApplicationShortcutItem(type: $0.rawValue, localizedTitle: $0.title, localizedSubtitle: $0.subtitle, icon: $0.icon) }
    }
    
    func processShortcutItem(shortcutItem: UIApplicationShortcutItem) {
        
        switch shortcutItem.type {
        case ApplicationShortcutItem.Item1.rawValue:
            print("Item 1 custom action")
        case ApplicationShortcutItem.Item2.rawValue:
            print("Item 2 custom action")
        case ApplicationShortcutItem.Item3.rawValue:
            print("Item 3 custom action")
        case ApplicationShortcutItem.Item4.rawValue:
            print("Item 4 custom action")
        default:
            print("Unknown item selected")
        }
    }
}

