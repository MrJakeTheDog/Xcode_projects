//
//  ViewController.swift
//  TableViewHomework
//
//  Created by Mr Jake on 12/2/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

var sections = ["Учні", "Вільні слухачі", "Вибули"]
var students = [
"Бондар Павло",
"Вождай Ігор",
"Демченко Михайло",
"Запорожець Максим",
"Ілюшенко Ілля",
"Nedopaka Alexander",
"Таченко Дмитро",
"Гуріненко Валентин"]
var off = ["Горошнюк Вячеслав",
           "БЕРЕЗА МАРИНА"]
var free = ["Пухлій Віталій",
            "Сагайдак Ілля",
            "Шурман Андрій",
            "Лавренко Віталій",
            "Братчикова Дар'я",
            "Крістіна"]
var sectionCount = 0

let detailViewController = UIStoryboard(name: "Main", bundle: nil)
    .instantiateViewController(identifier: "DetailViewController") as! DetailViewController

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FreeVisitorsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FreeVisitorsTableViewCell")
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return students.count
        case 1:
            return free.count
        default:
            return off.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: "Students", for: indexPath)// as! ViewController
             cell.textLabel?.text = "      " + students[indexPath.row]
            return cell
        case 1:
             let cell =  tableView.dequeueReusableCell(withIdentifier: "FreeVisitorsTableViewCell", for: indexPath)
             cell.textLabel?.text = "                " + free[indexPath.row]
            return cell
        default:
             let cell = tableView.dequeueReusableCell(withIdentifier: "ExitStudents", for: indexPath)
             cell.textLabel?.text = "      " + off[indexPath.row]
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        switch section {
        case 0:
            label.text=sections[0]
            label.translatesAutoresizingMaskIntoConstraints = false
        case 1:
            label.text=sections[1]
            label.translatesAutoresizingMaskIntoConstraints = false
        default:
            label.text=sections[2]
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubview(label)
        return view
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            sectionCount = 0
        case 1:
            sectionCount = 1
        default:
            sectionCount = 2
        }
        return "\(sections[sectionCount])"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailViewController.row = students[indexPath.row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? DetailViewController)?.row = detailViewController.row
    }

}
