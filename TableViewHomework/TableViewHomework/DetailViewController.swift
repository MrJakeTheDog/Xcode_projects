//
//  DetailViewController.swift
//  TableViewHomework
//
//  Created by Mr Jake on 12/8/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var row: String = ""
    
    @IBOutlet weak var studentName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func viewDidLoad() {
            super.viewDidLoad()
            studentName.text = row
        }
    }
}
