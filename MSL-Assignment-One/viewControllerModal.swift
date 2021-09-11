//
//  viewControllerModal.swift
//  MSL-Assignment-One
//
//  Created by William Chan on 9/10/21.
//

import Foundation
import UIKit

class viewControllerModal : UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
    }
    
    @IBAction func closeHandler(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
