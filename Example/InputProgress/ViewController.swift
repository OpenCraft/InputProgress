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
    
    // MARK: IBOutlets

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    
    // MARK: Properties
    
   private var inputProgress: InputProgress?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        accessoryView.backgroundColor = .green
        fourthTextField.inputAccessoryView = accessoryView
        firstTextField.inputAccessoryView = accessoryView
        
        inputProgress = InputProgress(presentingView: view, textFields: [firstTextField, secondTextField, thirdTextField, fourthTextField])
        inputProgress?.progress = 0.3
    }
    
    // MARK: Actions
    
    @IBAction func didTouchDismissKeyboard(_ sender: Any) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        thirdTextField.resignFirstResponder()
        fourthTextField.resignFirstResponder()
    }
    
    @IBAction func didTouchRandomColor(_ sender: Any) {
        inputProgress?.progressBarColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    @IBAction func didTouchRandomPercentage(_ sender: Any) {
        inputProgress?.progress = CGFloat(drand48())
    }
    
    @IBAction func didTouchToggleViewBar(_ sender: Any) {
        inputProgress?.shouldDisplayBottomViewBar = !(inputProgress?.shouldDisplayBottomViewBar ?? false)
    }
}

