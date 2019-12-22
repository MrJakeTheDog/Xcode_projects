//
//  Teacher+CoreDataProperties.swift
//  StudentDataBase
//
//  Created by Mr Jake on 22.12.2019.
//  Copyright © 2019 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var group: Group?

}
