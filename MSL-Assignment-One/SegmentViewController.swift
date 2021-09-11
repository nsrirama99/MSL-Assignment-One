//
//  SegmentViewController.swift
//  MSL-Assignment-One
//
//  Created by Anna Iorio on 9/10/21.
//

import UIKit

class SegmentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var uiView: UIView!
    
    var displayImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: displayImageName)
        
        
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imageView.image = UIImage(named: displayImageName)
            break
        case 1:
            imageView.image = UIImage(named: displayImageName + "-rotated")
            break
        default:
            break
        }
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if (sender.isOn) {
            uiView.backgroundColor = UIColor.red
        }
        else {
            uiView.backgroundColor = UIColor.white
        }
    }
    
}
