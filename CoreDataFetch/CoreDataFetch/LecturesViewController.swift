//
//  LecturesViewController.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 12.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit
import CoreData

class LecturesViewController: UIViewController {

    @IBOutlet weak var lecturesTableView: UITableView!
    let coreData = CoreDataStack.shared
    var lectures: Lectures?
    var counter: Int = 0

    lazy var frc = { () -> NSFetchedResultsController<Lectures> in
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Lectures>(entityName: "Lectures")

        // Configure the request's entity, and optionally its predicate
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "idTheme", ascending: true)]

        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        controller.delegate = self
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddLecturesAction(_ sender: UIBarButtonItem) {
        let addLecturesAlert = UIAlertController(title: "Add new", message: nil, preferredStyle: .alert)
        let addButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let nameTextField = addLecturesAlert.textFields![0] as UITextField
            let surnameTextField = addLecturesAlert.textFields![1] as UITextField

            print(nameTextField.text ?? "User name is nil")
            print(surnameTextField.text ?? "User surname is nil")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        addLecturesAlert.addTextField { (textField) in
            textField.placeholder = "Name"
        }

        addLecturesAlert.addTextField { (textField) in
            textField.placeholder = "Surname"
        }

        addLecturesAlert.addAction(addButton)
        addLecturesAlert.addAction(cancelButton)

        present(addLecturesAlert, animated: true, completion: nil)
    }
}
// MARK: - UITableViewDataSource
extension LecturesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        frc.sections!.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = self.frc.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let object = frc.object(at: indexPath)
        cell.textLabel?.text = object.theme
        return cell
    }
}

extension LecturesViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        lecturesTableView.reloadData()
        tabBarItem.badgeValue = "\(frc.fetchedObjects?.count ?? -1)"
    }
}
