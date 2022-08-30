//
//  Districts.swift
//  Demo
//
//  Created by admin on 23/08/2022.
//

import Foundation
struct DistrictResponse: Decodable {
    let districts : [District]
    
    private enum CodingKeys: String, CodingKey {
        case districts = "Districts"
    }
}
struct District: Decodable {
    let cityCode: Int
    let districtCode: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case cityCode = "CityCode"
        case districtCode = "DistrictCode"
        case name = "Name"
    }
}
