//
//  FirstViewController.swift
//  ToDoListv2
//
//  Created by Appcamp on 19/07/15.
//  Copyright (c) 2015 Appcamp. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = [Item]()
    
    @IBOutlet weak var ItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ItemsTableView.reloadData()
        fetchData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellId")
        
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.details
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            let itemToDelete = items[indexPath.row]
            
            itemsMgr.deleteItem(itemToDelete)
            
            self.fetchData()
            
        }
    }
    
    func fetchData() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let menageContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "Item")
        var error : NSError?
        let fetchResults = menageContext.executeFetchRequest(fetchRequest, error: &error) as? [Item]
        
        if let results = fetchResults {
            items = results
        }
        else {
            println("Could not fetch \(error), \(error?.userInfo)")
        }
        
        ItemsTableView.reloadData()
        
    }
    
    
    
    
    
}

