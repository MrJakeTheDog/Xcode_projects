//
//  ViewController.swift
//  project_1
//
//  Created by Mr Jake on 11/17/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    
    @IBOutlet weak var changeSegment: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var valueSlider: UISlider!
    @IBOutlet weak var colorSwitch: UISwitch!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activiteButton: UIButton!
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var countStepper: UIStepper!
    
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var viewImage: UIImageView!
    var number = 0
    
    @IBAction func imageShow(_ sender: UIButton) {
        viewImage.isHidden = false
    }
    @IBAction func showValueStepper(_ sender: UIStepper) {
        fifthLabel.text = String(countStepper.value)
    }
    @IBAction func indicatorStart(_ sender: UIButton) {
        activityIndicator.startAnimating()
    }
    @IBAction func backgroundSwitch(_ sender: UISwitch) {
        if colorSwitch.isOn {
            view.backgroundColor = .yellow
        } else {
            view.backgroundColor = .white
        }
    }
    @IBAction func showValue(_ sender: UISlider) {
        fourthLabel.text = String(valueSlider.value)
    }
    
    @IBAction func showText(_ sender: UIButton) {
        thirdLabel.text = textField.text
    }
    
    @IBAction func valueChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            secondLabel.text = "1"
        case 1:
            secondLabel.text = "2"
        default:
            break
        }
    }
    @IBAction func buttonTouched(_ sender: UIButton) {
        number += 10
        firstLabel.text = String(number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

