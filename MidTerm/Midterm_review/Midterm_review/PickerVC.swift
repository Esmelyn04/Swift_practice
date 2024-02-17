//
//  PickerVC.swift
//  Midterm_review
//
//  Created by ESMELYN BAEZ on 11/13/23.
//

import UIKit

protocol PickerVCDelegate: AnyObject {
    func pickerVC(_ controller: PickerVC, selectedIndex index: Int)
}

class PickerVC: UITableViewController {
    
    var delegate: PickerVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradientCell", for: indexPath)
        
        // Configure the cell...
        
        let label = cell.viewWithTag(1) as! UILabel
        
        label.text = "Gradient \(indexPath.row)"
        
        let imageV = cell.viewWithTag(2) as! UIImageView
        imageV.image = UIImage(named: "gradient-\(indexPath.row)")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.pickerVC(self, selectedIndex: indexPath.row)
        
        dismiss(animated: true)
    }
}
    
