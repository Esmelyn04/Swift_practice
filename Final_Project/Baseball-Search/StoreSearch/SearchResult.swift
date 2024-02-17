
import Foundation

class ResultArray: Codable {
  
  var body = [SearchResult]()
}

func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
  return lhs.longName!.localizedStandardCompare(rhs.longName!)
    == .orderedAscending
}

  

class SearchResult: Codable {
  
  var longName: String? =  ""
  var team: String? = ""        // This is the "Team" the player currently belong to.
  var mlbHeadshot = ""          // player photo
  var jerseyNum = ""
  var pos: String = ""          // player position
  var stats = Stats()
  
}

class Stats: Codable {
  var gamesStarted: String? = ""
  var gamesPlayed: String? = ""
  
  var team: String? = ""      // This is the "Team" the player belong to during the last season "2023"
  
  
  //var Fielding = fielding()
  //var BaseRunning = baseRunning()
  
  

  var Hitting: Optional = allHitting()
  var Pitching: Optional = allPitching()
  
}


class allHitting: Codable {
  
  var avg: String? = ""
  var HR: String? = ""
  var RBI: String? = ""
}

class allPitching: Codable {
  var Win: String? = ""
  var Loss: String? = ""
  var SO: String? = ""
}

class fielding: Codable {
  var E: String? = ""
}

class baseRunning: Codable {
  var SB: String? = ""
}
