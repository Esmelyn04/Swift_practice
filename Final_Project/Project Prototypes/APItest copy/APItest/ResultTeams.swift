//
//  ResultTeams.swift
//  APItest
//
//  Created by ESMELYN BAEZ on 12/16/23.
//

import Foundation

class ResultArrayTeams: Codable {
  
  
  var body = [SearchResultTeams]()
}
  

class SearchResultTeams: Codable {
  
  var teamName: String? =  ""
  var teamCity: String? = ""
  var espnLogo1 = ""
  
}
