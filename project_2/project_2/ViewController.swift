//
//  ViewController.swift
//  project_2
//
//  Created by Mr Jake on 11/17/19.
//  Copyright © 2019 Mr Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var slider: UISlider?
    var viewSecond: UIView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSecond = UIView(frame: CGRect(x: 82, y: 400, width: 250, height: 150))
        viewSecond?.backgroundColor = .black
        slider = UISlider(frame: CGRect(x: 82, y: 327, width: 250, height: 30))
        slider?.minimumValue = 0
        slider?.maximumValue = 1
        
        slider?.addTarget(self, action: #selector(changeViewAlpha(_:)), for: .valueChanged)
        view.addSubview(slider!)
        view.addSubview(viewSecond!)
    }
    
    @objc func changeViewAlpha(_ sender: UISlider) {
        viewSecond?.alpha = 1 - CGFloat(sender.value)
        viewSecond?.layer.cornerRadius = CGFloat(sender.value * 30)
    }
}

