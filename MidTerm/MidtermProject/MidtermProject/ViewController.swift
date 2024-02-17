//
//  ViewController.swift
//  MidtermProject
//
//  Created by ESMELYN BAEZ on 11/4/23.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, BackGroundViewControllerDelegate {
    
    @IBOutlet var imageBackGround: UIImageView!
    
    // call BackGroundVC delegate protocol
    
    func backGroundViewController(_ controller: BackGroundViewController, imageSelected newImage: String) {
        //navigationController?.popViewController(animated: true)
        
        imageBackGround.image = UIImage(named: newImage)
        
        //        imageBackGround.image = UIImage(named: "gradient-0")
        //        imageBackGround.image = UIImage(named: "gradient-1")
        //        imageBackGround.image = UIImage(named: "gradient-2")
        //
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    // MARK: - Navigation
    // func prepare the delegate (communication) between the two screen.
    //
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! BackGroundViewController
        
        if segue.identifier == "ViewController" {
            destination.delegate = self
            
        }
        
    }
}

