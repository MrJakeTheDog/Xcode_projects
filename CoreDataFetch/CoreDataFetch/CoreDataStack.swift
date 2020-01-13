//
//  CoreDataStack.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 12.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import CoreData

class CoreDataStack {

    static let shared = CoreDataStack()

    private init() { }

    private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (persistentStoreDescription, error) in
            if let error = error {
                debugPrint(error)
                return
            }
             debugPrint(persistentStoreDescription)
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        })
        return container
    }()
}
