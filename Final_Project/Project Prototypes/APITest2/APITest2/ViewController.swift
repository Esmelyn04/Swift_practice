//
//  ViewController.swift
//  APITest2
//
//  Created by ESMELYN BAEZ on 12/8/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        let headers = [
            "X-RapidAPI-Key": "SIGN-UP-FOR-KEY",
            "X-RapidAPI-Host": "mlb-data.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://mlb-data.p.rapidapi.com/json/named.player_teams.bam?player_id='493316'&season='2014'")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
            }
        })

        dataTask.resume()
    }


}

