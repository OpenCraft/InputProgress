//
//  ViewController.swift
//  InputProgress
//
//  Created by rottajuliano on 10/04/2017.
//  Copyright (c) 2017 rottajuliano. All rights reserved.
//

import UIKit
import InputProgress

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var accessoryTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        accessoryView.backgroundColor = .green
        accessoryTxtField.inputAccessoryView = accessoryView
        firstTextField.inputAccessoryView = accessoryView
        
        let inputProgress = InputProgress(presentingView: view, textFields: [txtField, accessoryTxtField, firstTextField, secondTextField])
        inputProgress.setProgress(0.3)
    }
    
    @IBAction func didTouchDismissKeyboard(_ sender: Any) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        txtField.resignFirstResponder()
        accessoryTxtField.resignFirstResponder()
    }
}

