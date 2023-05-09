//
//  Tattoo.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import Foundation


struct Tattoo: Codable, Identifiable, Hashable {
    var id: String?
    var description = ""
    var location = ""
    var notes = ""
    
    static let example = Tattoo(description: "Mom", location: "💪", notes: "Stay Swifty!")
}
