//
//  Tattoo.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import Foundation


struct Tattoo: Codable, Identifiable {
    var id = UUID().uuidString
    var description: String
    var location: String
    var notes: String
    
    static let example = Tattoo(description: "Mom", location: "💪", notes: "Stay Swifty!")
}
