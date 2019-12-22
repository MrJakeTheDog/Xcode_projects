//
//  Student+CoreDataProperties.swift
//  StudentDataBase
//
//  Created by Mr Jake on 22.12.2019.
//  Copyright © 2019 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var group: Group?
    @NSManaged public var project: Project?

}
