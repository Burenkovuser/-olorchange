//
//  ViewController.swift
//  Сolorchange
//
//  Created by Vasilii on 26/07/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
        
        redTextField.keyboardType = .decimalPad
        redTextField.text = String(redSlader.value)
        
        greenLabelOutlet.text = String(greenSlader.value)
        
        greenSlader.maximumTrackTintColor = .lightGray
        greenSlader.minimumTrackTintColor = .green
        
        greenTextField.keyboardType = .decimalPad
        greenTextField.text = String(greenSlader.value)
        
        blueLabelOutlet.text = String(blueSlader.value)
        
        blueSlader.maximumTrackTintColor = .lightGray
        blueSlader.minimumTrackTintColor = .blue
        
        blueTextField.keyboardType = .decimalPad
        blueTextField.text = String(blueSlader.value)

    }

    @IBAction func redSladerAction() {
        redLabelOutlet.text = "Red: " + String(format: "%.2f", redSlader.value)
        redTextField.text = String(format: "%.2f", redSlader.value)
        updateColor()
    }
    
    @IBAction func greenSladerAction() {
        greenLabelOutlet.text = "Green: " + String(format: "%.2f", greenSlader.value)
        greenTextField.text = String(format: "%.2f", greenSlader.value)
        updateColor()
    }
    
    @IBAction func blueSladerAction() {
        blueLabelOutlet.text = "Blue: " + String(format: "%.2f", blueSlader.value)
        blueTextField.text = String(format: "%.2f", blueSlader.value)
        updateColor()
    }
    
    
    private func updateColor () {
        let redAmuont = CGFloat(redSlader.value)
        let greenAmount = CGFloat(greenSlader.value)
        let blueAmount = CGFloat(blueSlader.value)
        
        let color = UIColor(red: redAmuont, green: greenAmount, blue: blueAmount, alpha: 1.0)
        
        colorView.backgroundColor = color
        
        self.addDoneButtonOnKeyboard()
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.redTextField.inputAccessoryView = doneToolbar
        self.greenTextField.inputAccessoryView = doneToolbar
        self.blueTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        guard let redInputNumbersField = redTextField.text, !redInputNumbersField.isEmpty else { return }
        redSlader.value = Float(redInputNumbersField) as! Float
        redLabelOutlet.text = String(format: "%.2f", redSlader.value)
        updateColor()
        
        guard let greenInputNumbersField = greenTextField.text, !greenInputNumbersField.isEmpty else { return }
        greenSlader.value = Float(greenInputNumbersField) as! Float
        greenLabelOutlet.text = String(format: "%.2f", greenSlader.value)
        updateColor()
        
        guard let blueInputNumbersField = blueTextField.text, !blueInputNumbersField.isEmpty else { return }
        blueSlader.value = Float(blueInputNumbersField) as! Float
        blueLabelOutlet.text = String(format: "%.2f", blueSlader.value)
        updateColor()
        
        self.view.endEditing(true)
    }
    
    // если тапем по экрану, клавиатура убирается
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
    }
}

