//
//  Tattoo.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import Foundation

enum Location: String, CaseIterable, Codable {
    case face = "😛"
    case neck = "🦒"
    case torso = "👕"
    case back = "🔙"
    case leftArm = "💪"
    case rightArm = "🦾"
    case leftLeg = "🦵"
    case rightLeg = "🦿"
}


struct Tattoo: Codable, Identifiable, Hashable {
    var id: String?
    var description = ""
    var location: Location = .face
    var notes = ""
    
    static let example = Tattoo(description: "Mom", location: .face, notes: "Stay Swifty!")
}
