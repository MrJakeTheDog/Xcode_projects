//
//  LecturesViewController.swift
//  CoreDataFetch
//
//  Created by Mr Jake on 12.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit

class LecturesViewController: UIViewController {

    @IBOutlet weak var AddLecturesButton: UIBarButtonItem!

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
