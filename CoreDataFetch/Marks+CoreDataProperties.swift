//
//  Marks+CoreDataProperties.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 21.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//
//

import Foundation
import CoreData


extension Marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Marks> {
        return NSFetchRequest<Marks>(entityName: "Marks")
    }

    @NSManaged public var clasification: String?
    @NSManaged public var idMark: Int16
    @NSManaged public var mark: String?
    @NSManaged public var homework: Homework?
    @NSManaged public var student: Students?

}
