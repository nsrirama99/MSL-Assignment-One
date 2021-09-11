//
//  CharacterViewController.swift
//  MSL-Assignment-One
//
//  Created by UbiComp on 9/9/21.
//

import UIKit

class CharacterViewController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
            
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var zoomSlider: UISlider!
    @IBOutlet weak var charViewPicker: UIPickerView!
    
    var displayImageName = "Pika_Ult"
    var row = 0
    
    lazy var pickerData = {
        return self.dataModel.getAllChars()
    }()
    
    lazy var dataModel = {
        return DataModel.sharedInstance()
    }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.dataModel.getImageWithName(displayImageName))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let size = self.imageView?.image?.size {
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.maximumZoomScale = 10
            self.scrollView.delegate = self
        }
        
        zoomSlider.minimumValue = 0.1
        zoomSlider.maximumValue = 10
        zoomSlider.value = 0.1
        
        self.charViewPicker.delegate = self
        self.charViewPicker.dataSource = self
        
        charViewPicker.selectRow(row, inComponent: 0, animated: false)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //print(CGFloat(sender.value))
        scrollView.zoomScale = CGFloat(sender.value)
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let name = pickerData[row] as? String {
            return name
        }
        return "idkman"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let name = pickerData[row] as? String {
            imageView?.image? = self.dataModel.getImageWithName(name)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
