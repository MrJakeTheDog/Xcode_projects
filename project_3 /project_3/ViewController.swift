//
//  ViewController.swift
//  project_3
//
//  Created by Mr Jake on 11/17/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorButton: UIButton!
    
    
    @IBAction func colorTintChange(_ sender: UIButton) {
        colorButton.tintColor = UIColor(red: CGFloat(Double.random(in: 0...1)), green: CGFloat(Double.random(in: 0...1)), blue: CGFloat(Double.random(in: 0...1)), alpha: 1)
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        colorButton.backgroundColor = UIColor(red: CGFloat(Double.random(in: 0...1)), green: CGFloat(Double.random(in: 0...1)), blue: CGFloat(Double.random(in: 0...1)), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

