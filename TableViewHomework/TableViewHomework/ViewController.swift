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
           "БЕРЕЗА МАРИНА",]
var free = ["Пухлій Віталій",
            "Сагайдак Ілля",
            "Шурман Андрій",
            "Лавренко Віталій",
            "Братчикова Дар'я",
            "Крістіна",]
var sectionCount = 0

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "FreeVisitorsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FreeVisitorsTableViewCell")
        tableView.reloadData()
        // Do any additional setup after loading the view.
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
            return tableView.dequeueReusableCell(withIdentifier: "Students", for: indexPath)// as! FreeVisitorsTableViewCell
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "FreeVisitorsTableViewCell", for: indexPath)
        default:
            return tableView.dequeueReusableCell(withIdentifier: "ExitStudents", for: indexPath)
        }
    }
    
  //  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //label for section
  //  }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            sectionCount = 1
        case 2:
            sectionCount = 1
        default:
            sectionCount = 2
        }
        return "\(sections[sectionCount])"
        
    }
}
