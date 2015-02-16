//
//  LogItem.swift
//  MyLog
//
//  Created by Jameson Quave on 2/16/15.
//  Copyright (c) 2015 JQ Software LLC. All rights reserved.
//

import Foundation
import CoreData

class LogItem: NSManagedObject {

    @NSManaged var itemText: String
    @NSManaged var title: String

}
