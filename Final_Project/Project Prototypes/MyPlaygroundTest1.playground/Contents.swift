import UIKit

var greeting = "Hello, playground"

import Foundation

let headers = [
    "X-RapidAPI-Key": "701e36a197msh87327418c41b49fp12ff22jsn005fcb789871",
    "X-RapidAPI-Host": "tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com/getMLBPlayerInfo?playerName=juan%20soto&getStats=true")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//    if (error != nil) {
//        print(error as Any)
//    } else {
//        let httpResponse = response as? HTTPURLResponse
//        print(httpResponse as Any)
//    }
    
    if error == nil && data != nil {
        
        
        // Try to parse out the data
        do {
            let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
            
            print(dictionary as Any)
        }
        catch {
            print("Error parsin response data")
        }
    }
})

dataTask.resume()
