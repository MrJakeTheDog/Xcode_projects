//
//  LectorsViewController.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 12.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit
import CoreData

class LectorsViewController: UIViewController {

    lazy var frc = { () -> NSFetchedResultsController<Lectors> in
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Lectors>(entityName: "Lectors")

        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "idLector", ascending: true)]

        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        controller.delegate = self
        return controller
    }()

    let coreData = CoreDataStack.shared
    var lector: Lectors?

    @IBOutlet weak var lectorsTableView: UITableView!

    @IBAction func addLectorAction(_ sender: UIBarButtonItem) {
        let addLectorAlert = UIAlertController(title: "Add new", message: nil, preferredStyle: .alert)
        let addButton = UIAlertAction(title: "Add", style: .default) { (action) in
            let nameTextField = addLectorAlert.textFields![0] as UITextField
            let surnameTextField = addLectorAlert.textFields![1] as UITextField

            self.lector = Lectors(context: self.coreData.persistentContainer.viewContext)
            print(nameTextField.text ?? "Lector name is nil")
            self.lector?.name = nameTextField.text
            print(surnameTextField.text ?? "Lector surname is nil")
            self.lector?.surname = surnameTextField.text
            self.saveCoreData()
            self.lectorsTableView.reloadData()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        addLectorAlert.addTextField { (textField) in
            textField.placeholder = "Name"
        }

        addLectorAlert.addTextField { (textField) in
            textField.placeholder = "Surname"
        }

        addLectorAlert.addAction(addButton)
        addLectorAlert.addAction(cancelButton)

        present(addLectorAlert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func saveCoreData() {
        do {
            try coreData.persistentContainer.viewContext.save()
        } catch {
            debugPrint(error)
            print("nu takoe")
        }
    }
}

// MARK: - UITableViewDataSource
extension LectorsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //frc.sections!.count
        guard let sections = self.frc.sections else {
                   fatalError("No sections in fetchedResultsController")
               }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let object = frc.object(at: indexPath)
        cell.textLabel?.text = object.name! + " " + object.surname!
        return cell
    }
}

extension LectorsViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        lectorsTableView.reloadData()
        //tabBarItem.badgeValue = "\(frc.fetchedObjects?.count ?? -1)"
    }
}
