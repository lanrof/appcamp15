//
//  ItemsMenager.swift
//  ToDoListv2
//
//  Created by Appcamp on 19/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import UIKit
import CoreData

var itemsMgr : ItemsMenager = ItemsMenager()

struct item {
    var name = ""
    var details = ""
}

class ItemsMenager : NSObject {
    
    var items = [item]()
    
    func addItem(name : String, details : String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let menageContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: menageContext)
        let itemMO = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: menageContext)
        
        itemMO.setValue(name, forKey: "name")
        itemMO.setValue(details, forKey: "details")
        
        var error : NSError?
        
        if !menageContext.save(&error) {
            println("Could not save! \(error) \(error?.userInfo)")
        }
        
    }
    
    func deleteItem(item : Item) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let menageContext = appDelegate.managedObjectContext!
    
        
        // Delete it from the managedObjectContext
        menageContext.deleteObject(item)
        
        var error : NSError?
        
        if !menageContext.save(&error) {
            println("Could not delete item! \(error) \(error?.userInfo)")
        }
    }
    
    
}