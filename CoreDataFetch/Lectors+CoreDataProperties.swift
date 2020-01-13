//
//  Lectors+CoreDataProperties.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 13.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Lectors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lectors> {
        return NSFetchRequest<Lectors>(entityName: "Lectors")
    }

    @NSManaged public var idLector: Int16
    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var lectures: NSSet?

}

// MARK: Generated accessors for lectures
extension Lectors {

    @objc(addLecturesObject:)
    @NSManaged public func addToLectures(_ value: Lectures)

    @objc(removeLecturesObject:)
    @NSManaged public func removeFromLectures(_ value: Lectures)

    @objc(addLectures:)
    @NSManaged public func addToLectures(_ values: NSSet)

    @objc(removeLectures:)
    @NSManaged public func removeFromLectures(_ values: NSSet)

}
