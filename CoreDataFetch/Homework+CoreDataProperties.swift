//
//  Homework+CoreDataProperties.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 21.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Homework {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Homework> {
        return NSFetchRequest<Homework>(entityName: "Homework")
    }

    @NSManaged public var idHomework: Int16
    @NSManaged public var task: String?
    @NSManaged public var lecture: Lectures?
    @NSManaged public var marks: NSSet?

}

// MARK: Generated accessors for marks
extension Homework {

    @objc(addMarksObject:)
    @NSManaged public func addToMarks(_ value: Marks)

    @objc(removeMarksObject:)
    @NSManaged public func removeFromMarks(_ value: Marks)

    @objc(addMarks:)
    @NSManaged public func addToMarks(_ values: NSSet)

    @objc(removeMarks:)
    @NSManaged public func removeFromMarks(_ values: NSSet)

}
