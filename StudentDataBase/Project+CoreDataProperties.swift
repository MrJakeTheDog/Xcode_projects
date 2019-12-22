//
//  Project+CoreDataProperties.swift
//  StudentDataBase
//
//  Created by Mr Jake on 22.12.2019.
//  Copyright © 2019 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var themeOfProject: String?
    @NSManaged public var student: Student?

}
