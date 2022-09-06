//
//  Jobs.swift
//  Demo
//
//  Created by admin on 06/09/2022.
//

import Foundation
struct JobsData : Decodable {
    let job: [Jobs]
}
struct Jobs: Decodable {
    let jobTitle: String
    let address: String
    let salary: String
    let requirement: String
}
