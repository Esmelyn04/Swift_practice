//
//  ViewController.swift
//  APItest
//
//  Created by ESMELYN BAEZ on 12/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    func parse(data: Data) -> [SearchResultTeams] {
      do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(
          ResultArrayTeams.self, from: data)
        return result.body
      } catch {
        print("JSON Error: \(error)")
        return []
      }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    // URL
    let url = URL(string: "https://tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com/getMLBTeams?")
        
        // "https://itunes.apple.com/search?term=%@&getStats=false"
        //despues de %@ agregar & para incluir los parametros que faltan
        
        
        guard url != nil else {
            print("Error creating url object")
            return
        }
        
        // URL Request
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        

        // Specify the header
        let header = [
            "X-RapidAPI-Key": "701e36a197msh87327418c41b49fp12ff22jsn005fcb789871",
            "X-RapidAPI-Host": "tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com"
        ]
        
        request.allHTTPHeaderFields = header
        
        // Set the request type
        request.httpMethod = "GET"
        
        // Get the URLSessiion
        let session = URLSession.shared
        
        
        // Create the data task
        let dataTask = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            
            // Check for errors
            if error == nil && data != nil {
                
                
                // Try to parse out the data
                do {
                    let dictionary = parse(data: data? ?? nil)
//                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]""
//
//                    print(dictionary as Any)
                }
                catch {
                    print("Error parsin response data")
                }
            }
        }
        
        dataTask.resume()
        
    }
    


}

