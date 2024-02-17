//
//  ViewController.swift
//  BaseballLover
//
//  Created by ESMELYN BAEZ on 12/7/23.
//

import UIKit

class PlayerVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var searchResults = [SearchResult]()
    var hasSearched = false
    
    struct TableView {
        struct CellIdentifiers {
            static let searchResultCell = "SearchResultCell"
            static let nothingFoundCell = "NothingFoundCell"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 51, left: 0, bottom:
                                                0, right: 0)
        
        var cellNib = UINib(nibName: TableView.CellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.searchResultCell)
        
        cellNib = UINib(nibName:
                            TableView.CellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(
            cellNib,
            forCellReuseIdentifier:
                TableView.CellIdentifiers.nothingFoundCell)
        
        searchBar.becomeFirstResponder()
    }
    


    
}
// MARK: - Helper Methods


func iTunesURL(searchText: String) -> URL {
    
    let encodedText = searchText.addingPercentEncoding(
          withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    
    let urlString = String(
        format: "https://itunes.apple.com/search?term=%@",
        encodedText)
    
    
    let url = URL(string: urlString)
    return url!

    
    
// WORKING PART............
//    
//    
//    let urlString = String(
//        format: "https://tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com/getMLBPlayerInfo?playerName=%@&getStats=true",
//        encodedText)
//    
//    let url = URL(string: urlString)
//    
//    
////    let url = URL(string: "https://tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com/getMLBPlayerInfo?playerName=%@&getStats=false")
//    
//    
//    
//    let header = [
//        "X-RapidAPI-Key": "701e36a197msh87327418c41b49fp12ff22jsn005fcb789871",
//        "X-RapidAPI-Host": "tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com"
//    ]
//    
//    let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//    
//    request.allHTTPHeaderFields = header
//    request.httpMethod = "GET"
//    
//    let session = URLSession.shared
//    
//    let dataTask = session.dataTask(with: request as URLRequest) {
//        (data, response, error) in
//        
//        if error == nil && data != nil {
//            
//            do {
//                let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
//                
//                print(dictionary as Any)
//            }
//            catch {
//                print("Error parsin response data")
//            }
//        }
//    }
//    
//    dataTask.resume()
//    
//    return url!
//    
//    
    

}


//func performStoreRequest(with url: URL) -> String? {
//    do {
//        return try String(contentsOf: url, encoding: .utf8)
//    } catch {
//        print("Download Error: \(error.localizedDescription)")
//        return nil
//    }
//}

func performStoreRequest(with url: URL) -> Data? {
    do {
        return try Data(contentsOf: url)
    } catch {
        print("Download Error: \(error.localizedDescription)")
        
        showNetworkError()
        return nil
    }
}







func parse(data: Data) -> [SearchResult] {
    do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(
            ResultArray.self, from: data)
        return result.results
        
    } catch {
        print("JSON Error: \(error)")
        return []
    }
    
    
}




func showNetworkError() {
    let alert = UIAlertController(
        title: "Whoops...",
        message: "There was an error accessing the iTunes Store." +
        " Please try again.",
        preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    //present(alert, animated: true, completion: nil)

    
//    let action = UIAlertAction(
//        title: "OK", style: .default, handler: nil)
//    alert.addAction(action)
//    present(alert, animated: true, completion: nil)
}







// MARK: - Search Bar Delegate



extension PlayerVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            print(searchBar.text!)
            
            hasSearched = true
            searchResults = []
            
            let url = iTunesURL(searchText: searchBar.text!)
            print("URL: '\(url)'")
            
//            if let jsonString = performStoreRequest(with: url) {
//                print("Received JSON string '\(jsonString)'")
            
            if let data = performStoreRequest(with: url) {
//                let results = parse(data: data)
//                print("Got results: \(results)")
                
                searchResults = parse(data: data)
                
            }
                
                
                

            
            tableView.reloadData()
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}














// MARK: - Table View Delegate


extension PlayerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) ->
    Int {
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        
        if searchResults.count == 0 {
            return tableView.dequeueReusableCell(
                withIdentifier:
                    TableView.CellIdentifiers.nothingFoundCell,
                for: indexPath)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.searchResultCell, for: indexPath) as! SearchResultCell
            
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
            cell.artistNameLabel.text = searchResult.artistName
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView,willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
}


