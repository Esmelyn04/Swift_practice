//
//  BackgroundColors.swift
//  MidtermProject
//
//  Created by ESMELYN BAEZ on 11/4/23.
//

import Foundation
import UIKit

// protocol delegate to send newImage ("Gradient") to first screen ViewController

protocol BackGroundViewControllerDelegate: AnyObject {
    func backGroundViewController(
        _ controller: BackGroundViewController
        ,imageSelected newImage: String)
    
    
}

class BackGroundViewController : UITableViewController {
    
    var delegate: BackGroundViewControllerDelegate?

    
    var ImageToSet = ""    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Table View Data Source
    
    // How many rows
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 3 }
    
    
    // modify the Label and Image according to the Index number
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BackGround",
            for: indexPath)
        
        // viewWithTag () use to refert to a specific object in
        
        let label = cell.viewWithTag(1000) as! UILabel
        let assets = cell.viewWithTag(2000) as! UIImageView
        if indexPath.row == 0 {
            
            label.text = "Gradient 0"
            assets.image = UIImage(named: "gradient-0")
            
        } else if indexPath.row == 1 {
            label.text = "Gradient 1"
            assets.image = UIImage(named: "gradient-1")
            
            //imageBackGround.image = UIImage(named: "gradient-1")
            
        } else if indexPath.row == 2 {
            label.text = "Gradient 2"
            assets.image = UIImage(named: "gradient-2")
            
        }
        return cell
    }
    
    // didSelectRowAt()
    // What happen after select a row.
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        
        print("the Index is: \(indexPath.row)")
        
        let imagenIndex = indexPath.row
        
        if imagenIndex == 0 {
            ImageToSet = "gradient-0"
            
        }else if imagenIndex == 1 {
            ImageToSet = "gradient-1"
            
        }else if imagenIndex == 2 {
            ImageToSet = "gradient-2"
        }
        
        
        // let the delegate knows the gradient selected
        
        delegate?.backGroundViewController(self, imageSelected: ImageToSet)
        
        //print(indexPath.row)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true, completion: nil)
        

        func imageToSelect() {

        }

        
    }
    

    
    
}

