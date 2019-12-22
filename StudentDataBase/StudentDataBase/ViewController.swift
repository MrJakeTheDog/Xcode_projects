//
//  ViewController.swift
//  StudentDataBase
//
//  Created by Mr Jake on 21.12.2019.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let coreData = CoreDataStack.shared
    var teacher: Teacher?

    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var teacherDateBirthLabel: UILabel!
    @IBOutlet weak var teacherNameTextEdit: UITextField!
    @IBOutlet weak var teacherBirthDatePicker: UIDatePicker!

    @IBAction func teacherDataSaveButton(_ sender: UIButton) {
        teacher = Teacher(context: coreData.persistentContainer.viewContext)
        teacher?.name = teacherNameTextEdit.text
        teacher?.dateOfBirth = teacherBirthDatePicker.date

        saveCoreData()

        teacherNameLabel.text = teacher?.name
    }

    @IBAction func teacherDataDeleteButton(_ sender: UIButton) {
        if let teacher = self.teacher {
            coreData.persistentContainer.viewContext.delete(teacher)
            saveCoreData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func saveCoreData() {
        do {
            try coreData.persistentContainer.viewContext.save()
        } catch {
            debugPrint(error)
        }
    }

}

