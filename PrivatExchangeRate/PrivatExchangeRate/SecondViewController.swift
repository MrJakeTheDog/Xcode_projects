//
//  SecondViewController.swift
//  PrivatExchangeRate
//
//  Created by Mr Jake on 18.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit
import Moya

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - IBOutlet
    @IBOutlet weak var officesTableView: UITableView!

    // MARK: - Variables
    var choices = ["","Черкаси","Кіровоград","Сміла","Ужгород","Житомир"]
    var pickerView = UIPickerView()
    var typeValue = "Черкассы"
    var office = [Office]()

    let provider = MoyaProvider<PrivatAPI>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestOffices(city: self.typeValue)
        officesTableView.delegate = self
        officesTableView.dataSource = self
    }

    // MARK: - IBAction showPickerViewAction
    @IBAction func showPickerViewAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Вибір міста", message: "\n\n\n\n\n\n", preferredStyle: .alert)

        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))

        alert.view.addSubview(pickerFrame)
        pickerFrame.dataSource = self
        pickerFrame.delegate = self

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            self.requestOffices(city: self.typeValue)
        }))
        self.present(alert,animated: true, completion: nil )
    }

    // MARK: - Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 1: typeValue = "Черкассы"
        case 2: typeValue = "Кировоград"
        case 3: typeValue = "Смела"
        case 4: typeValue = "Ужгород"
        case 5: typeValue = "Житомир"
        default: typeValue = ""
        }
    }

    private func requestOffices(city: String?) {
        provider.request(.getOffices(city: typeValue) ) { rates in
            do {
                let response = try rates
                    .get()
                self.office = try response.map([Office].self)
                DispatchQueue.main.async {
                    self.officesTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension SecondViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        office.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = office[indexPath.row].name.capitalized
        cell.detailTextLabel?.text = office[indexPath.row].address.capitalized + "; " + office[indexPath.row].phone.capitalized 
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.text = office.first?.city
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return view
    }
}

// MARK: - UITableViewDelegate
extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return office.first?.city
    }
}
