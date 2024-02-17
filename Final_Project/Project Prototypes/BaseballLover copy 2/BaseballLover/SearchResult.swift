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


class ResultArray: Codable {
    
    
    var resultCount = 0
    var results = [SearchResult]()
    
}

//    var body = 0
//    var results = [SearchResult]()}


class SearchResult: Codable, CustomStringConvertible {
    
    
    var artistName: String? = ""
    var trackName: String? = ""
    var kind: String? = ""
    var trackPrice: Double? = 0.0
    var currency = ""
    
    var imageSmall = ""
    var imageLarge = ""
    var storeURL: String? = ""
    var genre = ""
    
    enum CodingKeys: String, CodingKey {
      case imageSmall = "artworkUrl60"
      case imageLarge = "artworkUrl100"
      case storeURL = "trackViewUrl"
      case genre = "primaryGenreName"
      case kind, artistName, trackName
      case trackPrice, currency
    }


    var name: String {
        return trackName ?? ""
    }

    
    var description: String {
        
        
//        return "\nResult - Name: \(name), Artist Name: \(artistName ?? "None")"
        return "\nResult - Kind: \(kind ?? "None"),Name: \(name), Artist Name: \(artistName ?? "None")"
        
        
    }
}
    

