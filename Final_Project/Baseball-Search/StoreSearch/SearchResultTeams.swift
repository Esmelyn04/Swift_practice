//
//  SearchResultTeams.swift
//  StoreSearch
//
//  Created by ESMELYN BAEZ on 12/16/23.
//

import Foundation



class ResultArrayTeams: Codable {
  
  
  var body = [SearchTeamResult]()
}
  
func < (lhs: SearchTeamResult, rhs: SearchTeamResult) -> Bool {
    return lhs.teamName!.localizedStandardCompare(rhs.teamName!)
    == .orderedAscending
}

class SearchTeamResult: Codable {
  
  var teamName: String? =  ""
  var teamCity: String? = ""
  var espnLogo1 = ""
  
}

