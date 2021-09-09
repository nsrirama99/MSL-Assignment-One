//
//  ViewController.swift
//  MSL-Assignment-One
//
//  Created by UbiComp on 9/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var entryText: UILabel!

    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.minimumValue = 15
        stepper.maximumValue = 30
        
        
        
    }

    
    
    @IBAction func startButton(_ sender: Any) {
    }
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        let stepVal = sender.value
        entryText.font = entryText.font.withSize(CGFloat(stepVal))
    }
    
}

