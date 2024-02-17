//
//  HomeViewController.swift
//  StoreSearch
//
//  Created by ESMELYN BAEZ on 12/14/23.
//

import UIKit
import Foundation
import AVFoundation

class HomeViewController: UIViewController {
  
  var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()


    }
  
  @IBAction func btcClicked(sender: AnyObject) {
    // This method is used for play the sound
    
    let sound = Bundle.main.url(forResource: "BaseballAudio", withExtension: "wav")
          player = try! AVAudioPlayer(contentsOf: sound!)
          player?.play()

    
  }
  
  
  
  
}
