//
//  AddStudentViewController.swift
//  TableViewHomework
//
//  Created by Mr Jake on 16.12.2019.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var sections = ["Учні", "Вільні слухачі", "Вибули"]

    @IBOutlet weak var typeStudentPickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        typeStudentPickerView.delegate = self
           typeStudentPickerView.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sections.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sections[row]
    }
}
