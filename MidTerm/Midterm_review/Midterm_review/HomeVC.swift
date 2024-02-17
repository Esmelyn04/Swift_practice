//
//  ViewController.swift
//  Midterm_review
//
//  Created by ESMELYN BAEZ on 11/13/23.
//

import UIKit

class HomeVC: UIViewController, PickerVCDelegate {
    
    @IBOutlet weak var myImageV: UIImageView!
    
    func pickerVC(_ controller: PickerVC, selectedIndex index: Int) {
        myImageV.image = UIImage(named: "gradient-\(index)")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PickerVC
        
        if segue.identifier == "toPicker"{
            
            destination.delegate = self
            
        }
        
        
    }


}

