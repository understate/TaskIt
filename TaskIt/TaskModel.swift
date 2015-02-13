//
//  TaskModel.swift
//  TaskIt
//
//  Created by Christian Köhler on 12.02.15.
//  Copyright (c) 2015 Christian A. Köhler. All rights reserved.
//

import Foundation
import CoreData


@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
