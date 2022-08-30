//
//  MoviesApi.swift
//  Demo
//
//  Created by admin on 24/08/2022.
//

import Foundation
struct MoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let overview: String
    let title: String
    let voteaverage: Float
    let posterpath: String
    var isOpen = true
    private enum CodingKeys: String, CodingKey {
        case voteaverage = "vote_average"
        case posterpath = "poster_path"
        case overview = "overview"
        case title = "title"
   }
}
