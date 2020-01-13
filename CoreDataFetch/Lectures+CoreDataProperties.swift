//
//  Lectures+CoreDataProperties.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 13.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Lectures {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lectures> {
        return NSFetchRequest<Lectures>(entityName: "Lectures")
    }

    @NSManaged public var idTheme: Int16
    @NSManaged public var theme: String?
    @NSManaged public var lector: Lectors?
    @NSManaged public var homeworks: NSSet?

}

// MARK: Generated accessors for homeworks
extension Lectures {

    @objc(addHomeworksObject:)
    @NSManaged public func addToHomeworks(_ value: Homework)

    @objc(removeHomeworksObject:)
    @NSManaged public func removeFromHomeworks(_ value: Homework)

    @objc(addHomeworks:)
    @NSManaged public func addToHomeworks(_ values: NSSet)

    @objc(removeHomeworks:)
    @NSManaged public func removeFromHomeworks(_ values: NSSet)

}
