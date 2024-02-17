//
//  TeamSearchVC.swift
//  StoreSearch
//
//  Created by ESMELYN BAEZ on 12/16/23.
//

import UIKit

class TeamSearchVC: UIViewController {
  
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  var filterSearchResults = [SearchTeamResult]()
  var searchResults = [SearchTeamResult]()

  var hasSearched = false
  var dataTask: URLSessionDataTask?
  var isLoading = false

  struct TableView {
    struct CellIdentifiers {
      static let searchResultCell = "SearchResultCell"
      static let nothingFoundCell = "NothingFoundCell"
      static let loadingCell = "LoadingCell"
    }
  }

  // viewDidLoad method is init method of UIViewController.
  override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Team List"
      registerCellXib()
      apiCall()
  }
  
  // Method is used for register table view cell xibs. we used 3 type of cell here.
  // No data found cell
  // Loading Cell
  // Data cell (List of records)
  func registerCellXib(){
    
    tableView.contentInset = UIEdgeInsets(top: 91, left: 0, bottom: 0, right: 0)
    
    var cellNib = UINib(nibName: TableView.CellIdentifiers.searchResultCell, bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier:
                        TableView.CellIdentifiers.searchResultCell)
    
    cellNib = UINib(nibName:
                      TableView.CellIdentifiers.nothingFoundCell, bundle: nil)
    tableView.register(
      cellNib,
      forCellReuseIdentifier:
        TableView.CellIdentifiers.nothingFoundCell)
    
    cellNib = UINib(
      nibName: TableView.CellIdentifiers.loadingCell,
      bundle: nil)
    tableView.register(
      cellNib,
      forCellReuseIdentifier: TableView.CellIdentifiers.loadingCell)
  }
  
  // Method is used to call api and get result using URLSession.
  func apiCall(){
      isLoading = true
      tableView.reloadData()
      hasSearched = true
      
      let url = URL(string: "https://tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com/getMLBTeams?teamStats=true&topPerformers=true")
      
      
      let header = [
          "X-RapidAPI-Key": "701e36a197msh87327418c41b49fp12ff22jsn005fcb789871",
          "X-RapidAPI-Host": "tank01-mlb-live-in-game-real-time-statistics.p.rapidapi.com"
      ]
      
      let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
      
      request.allHTTPHeaderFields = header
      request.httpMethod = "GET"
      
      let session = URLSession.shared
      
      let dataTask = session.dataTask(with: request as URLRequest) {
          (data, response, error) in
          
          if let error = error {
              print("Failure! \(error.localizedDescription)")
          } else {
              //print("Success! \(response!)")
              
              if let data = data {
                  self.searchResults = self.parse(data: data)
                  self.searchResults.sort(by: <)

                  self.filterSearchResults = self.searchResults
                  DispatchQueue.main.async {
                      self.isLoading = false
                      self.tableView.reloadData()
                  }
                  return
              }
          }
      }
      dataTask.resume()
      
      
  }
  
  
// MARK: - Helper Methods
  // This method is used to convert response from Data to SearchResultTeams object.
  func parse(data: Data) -> [SearchTeamResult] {
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
}


// MARK: - Search Bar Delegate
extension TeamSearchVC: UISearchBarDelegate {
  // this deligate method is call when user type in search bar.
  //In this method we filter the main arraynwith searched text and fill filterSearchResults.
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
      
      let updatedText = NSString(string: searchBar.text!).replacingCharacters(in: range, with: text)

      
      let approvalArray = searchResults.filter{$0.teamName!.lowercased().contains(updatedText.lowercased())
      }
      filterSearchResults = approvalArray
      if(updatedText == ""){
          filterSearchResults = searchResults
      }
      tableView.reloadData()
      return true
  }

}

// MARK: - Table View Delegate
extension TeamSearchVC: UITableViewDelegate,
                      UITableViewDataSource {
  
  // This delegate method is used to return no of row count
  func tableView(
      _ tableView: UITableView,
      numberOfRowsInSection section: Int) -> Int {
      if isLoading {
          return 1
      }else if !hasSearched {
          return 0
      }else if filterSearchResults.count == 0 {
          return 1
      } else {
          return filterSearchResults.count
      }
  }
 
  // This datasource method is used to set data on table view

  func tableView(
      _ tableView: UITableView,
      cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if isLoading {
          let cell = tableView.dequeueReusableCell(
              withIdentifier: TableView.CellIdentifiers.loadingCell,
              for: indexPath)
          let spinner = cell.viewWithTag(100) as!
          UIActivityIndicatorView
          spinner.startAnimating()
          return cell
      }else if filterSearchResults.count == 0 {
          return tableView.dequeueReusableCell(
              withIdentifier: TableView.CellIdentifiers.nothingFoundCell,
              for: indexPath)
      } else {
          let cell = tableView.dequeueReusableCell(
              withIdentifier: TableView.CellIdentifiers.searchResultCell,
              for: indexPath) as! SearchResultCell
          
          let searchResult = filterSearchResults[indexPath.row]
          
          cell.configureTeam(for: searchResult)
          return cell
      }
  }
  func tableView(
      _ tableView: UITableView,
      didSelectRowAt indexPath: IndexPath){
      tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(
      _ tableView: UITableView,
      willSelectRowAt indexPath: IndexPath
  ) -> IndexPath? {
      if filterSearchResults.count == 0 || isLoading {
          return nil
      } else {
          return indexPath
      }
  }
  
  
}

