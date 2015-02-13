//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Christian Köhler on 08.02.15.
//  Copyright (c) 2015 Christian A. Köhler. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    

    
    @IBOutlet weak var taskTextfield: UITextField!
    @IBOutlet weak var subTaskTextfield: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func addTaskButtonPressed(sender: UIButton) {

        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        
        task.task = taskTextfield.text
        task.subtask = subTaskTextfield.text
        task.date = dueDatePicker.date
        task.completed = false
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        var results:NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        for res in results {
            println(res)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

   }
