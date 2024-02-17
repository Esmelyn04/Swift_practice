//
//  ViewController.swift
//  Project test
//
//  Created by ESMELYN BAEZ on 9/20/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//
//  ViewController.swift
//  BullsEye
//
//  Created by Lehman on 9/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //method that runs as soon as the view loads on your device
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()

        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        print(currentValue)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        let message = "You got \(points) points"
        score += points
        //creates the view, AKA the pop up to display to the user
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        //action creates a button to dismiss the pop up
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        //adding the button to the pop-up
        alert.addAction(action)
        //present the popup
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    func startNewRound(){
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

