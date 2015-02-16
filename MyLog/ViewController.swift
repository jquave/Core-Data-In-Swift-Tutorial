//
//  ViewController.swift
//  MyLog
//
//  Created by Jameson Quave on 2/16/15.
//  Copyright (c) 2015 JQ Software LLC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("LogItem", inManagedObjectContext: self.managedObjectContext!) as! LogItem

        newItem.title = "Wrote Core Data Tutorial"
        newItem.itemText = "Wrote and post a tutorial on the basics of Core Data to blog."

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create a new fetch request using the LogItem entity
        let fetchRequest = NSFetchRequest(entityName: "LogItem")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [LogItem] {
            
            // Create an Alert, and set it's message to whatever the itemText is
            let alert = UIAlertController(title: fetchResults[0].title,
                message: fetchResults[0].itemText,
                preferredStyle: .Alert)
            
            // Display the alert
            self.presentViewController(alert,
                animated: true,
                completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

