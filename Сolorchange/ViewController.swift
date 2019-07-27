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
        
        redLabelOutlet.text = String(redSlader.value)
        
        redSlader.maximumTrackTintColor = .lightGray
        redSlader.minimumTrackTintColor = .red
        
        redTextField.text = String(redSlader.value)
        
        greenLabelOutlet.text = String(greenSlader.value)
        
        greenSlader.maximumTrackTintColor = .lightGray
        greenSlader.minimumTrackTintColor = .green
        
        greenTextField.text = String(greenSlader.value)
        
        blueLabelOutlet.text = String(blueSlader.value)
        
        blueSlader.maximumTrackTintColor = .lightGray
        blueSlader.minimumTrackTintColor = .blue
        
        blueTextField.text = String(blueSlader.value)

    }

    @IBAction func redSladerAction() {
        redLabelOutlet.text = String(format: "%.2f", redSlader.value)
        redTextField.text = String(format: "%.2f", redSlader.value)
        updateColor()
    }
    
    @IBAction func greenSladerAction() {
        greenLabelOutlet.text = String(format: "%.2f", greenSlader.value)
        greenTextField.text = String(format: "%.2f", greenSlader.value)
        updateColor()
    }
    
    @IBAction func blueSladerAction() {
        blueLabelOutlet.text = String(format: "%.2f", blueSlader.value)
        blueTextField.text = String(format: "%.2f", blueSlader.value)
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

