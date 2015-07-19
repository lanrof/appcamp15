//
//  ItemsMenager.swift
//  ToDoListv2
//
//  Created by Appcamp on 19/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import Foundation

var itemsMgr : ItemsMenager = ItemsMenager()

struct item {
    var name = ""
    var details = ""
}

class ItemsMenager : NSObject {
    
    var items = [item]()
    
    func addItem(name : String, details : String) {
        items.append(item(name : name, details : details))
    }
    
    
}