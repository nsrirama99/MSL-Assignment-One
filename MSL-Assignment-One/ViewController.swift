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
    
    @IBOutlet weak var modalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.minimumValue = 15
        stepper.maximumValue = 30
        
        var time = 0
        
        let timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { timer in
            
            if(time % 2 == 0){
            self.entryText.text = "Welcome to Smash App!"
                time+=1
            }else{
                self.entryText.text = "Press Start to Contiune"
                time+=1
            }
        }

        
        
    }
    

    
    
    @IBAction func startButton(_ sender: Any) {
    }
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        let stepVal = sender.value
        entryText.font = entryText.font.withSize(CGFloat(stepVal))
    }
    @IBAction func modalView(_ sender: Any) {
        
        let viewControllerModal = storyboard?.instantiateViewController(withIdentifier: "viewControllerModal") as! viewControllerModal
        
        present(viewControllerModal,animated: true, completion: nil)
        
    }
    
}

