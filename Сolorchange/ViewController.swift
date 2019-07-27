//
//  ViewController.swift
//  Сolorchange
//
//  Created by Vasilii on 26/07/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabelOutlet: UILabel!
    @IBOutlet weak var greenLabelOutlet: UILabel!
    @IBOutlet weak var blueLabelOutlet: UILabel!
    
    @IBOutlet weak var redSlader: UISlider!
    @IBOutlet weak var greenSlader: UISlider!
    @IBOutlet weak var blueSlader: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateColor()
    }

    @IBAction func redSladerAction() {
        updateColor()
    }
    
    @IBAction func greenSladerAction() {
        updateColor()
    }
    
    @IBAction func blueSladerAction() {
        updateColor()
    }
    
    
    private func updateColor () {
        let redAmuont = CGFloat(redSlader.value)
        let greenAmount = CGFloat(greenSlader.value)
        let blueAmount = CGFloat(blueSlader.value)
        
        let color = UIColor(red: redAmuont, green: greenAmount, blue: blueAmount, alpha: 1.0)
        
        colorView.backgroundColor = color
    }
}

