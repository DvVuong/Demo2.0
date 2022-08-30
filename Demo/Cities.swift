//
//  Cities.swift
//  Demo
//
//  Created by admin on 23/08/2022.
//

import Foundation
struct CityRespone: Decodable {
    let cities: [City]
    
    
    private enum CodingKeys: String, CodingKey {
        case cities = "Cities"
    }
   
}
struct City: Decodable {
    let cityCode: Int
    let name: String
    var isOpen = true
    private enum CodingKeys: String, CodingKey {
        case cityCode = "CityCode"
        case name = "Name"
    }
}
