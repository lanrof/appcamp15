//
//  Item.swift
//  ToDoListv2
//
//  Created by appcamp on 25/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var details: String

}
