//
//  SearchResult.swift
//  BaseballLover
//
//  Created by ESMELYN BAEZ on 12/7/23.
//

import Foundation

//class SearchResult {
//  var name = ""
//  var teamName = ""
//}




//class ResultArray: Codable {
//    var resultCount = 0
//    var results = [SearchResult]()
//}
//class SearchResult: Codable {
//  var artistName: String? = ""
//  var trackName: String? = ""
//  var name: String {
//    return trackName ?? ""
//  }
//}


class ResultArray: Codable {
    
    var ACTIVEROSTER: Bool
    var bDay: String? = ""
    var bat: String? = ""
    var cbsPlayerID: Int
    var espnHeadshot: String? = ""
    var espnID: Int
    var espnLink = "";
    var height: String = "6-2";
    var jerseyNum = 22;
    var lastGamePlayed = "20231001_SD@CHW";
    var longName = "Juan Soto";
    var mlbHeadshot = "https://img.mlbstatic.com/mlb-photos/image/upload/d_people:generic:headshot:silo:current.png/r_max/w_180,q_auto:best/v1/people/665742/headshot/silo/current";
    var mlbID = 665742;
    var mlbIDFull = "juan-soto-665742";
    var mlbLink = "https://www.mlb.com/player/juan-soto-665742";
    var playerID = 665742;
    var pos = LF;
    var rotoWirePlayerID = 13960;
    var rotoWirePlayerIDFull = "juan-soto-13960";
    var sleeperBotID = 2013;
    var stats [SearchResult]()
    var team = NYY;
    var teamAbv = NYY;
    var teamID = 19;
    var throw = L;
    var weight = 224;
    
}
