//
//  SecondViewController.swift
//  PrivatExchangeRate
//
//  Created by Mr Jake on 18.01.2020.
//  Copyright © 2020 Mr Jake. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - IBOutlet
    @IBOutlet weak var officesTableView: UITableView!

    // MARK: - Variables
    var choices = ["","Черкаси","Кіровоград","Сміла","Ужгород","Житомир"]
    var pickerView = UIPickerView()
    var typeValue = "Черкассы"
    var office = [Office]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestOffices(city: self.typeValue)
        DispatchQueue.main.async {
            self.officesTableView.reloadData()
        }
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

    // https://api.privatbank.ua/p24api/pboffice?json&city=Черкассы
    private func requestOffices(city: String) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.privatbank.ua"
        components.path = "/p24api/pboffice"
        components.queryItems = [URLQueryItem(name: "json", value: nil),
                                 URLQueryItem(name: "city", value: city)]
        guard let url = components.url else { return }

        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    self.handle(responseData: data)
                }
                if let _ = data, (300...700).contains(response.statusCode) {
                    print("IT'S NOT OK!!! ERROR")
                }
        }.resume()
    }

    private func handle(responseData: Data) {
        office = try! JSONDecoder().decode([Office].self, from: responseData)
        DispatchQueue.main.async {
            self.officesTableView.reloadData()
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
