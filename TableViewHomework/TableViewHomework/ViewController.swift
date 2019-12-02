//
//  ViewController.swift
//  TableViewHomework
//
//  Created by Mr Jake on 12/2/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

var sections = ["Учні", "Вільні слухачі", "Вибули"]
var sectionCount = 0

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "StudentsCells", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "StudentsCells")
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
            return 8
        case 1:
            return 5
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var identifier = "DefaultCell"
        
        if (indexPath.section == 0) {
            identifier = "DefaultCell"
        } else if (indexPath.section == 1) {
            identifier = "DefaultCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "Index \(indexPath)"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            sectionCount = 0
        case 2:
            sectionCount = 1
        default:
            sectionCount = 2
        }
        return "\(sections[sectionCount])"
        
    }
}
