//
//  Tattoo.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import Foundation

enum Location: String, CaseIterable, Codable {
    case face, neck, torso, back, left_arm, right_arm, left_leg, right_leg
    
    func emoji() -> String {
        switch self {
        case .face:
            return "😛"
        case .neck:
            return "🦒"
        case .torso:
            return "👕"
        case .back:
            return "🔙"
        case .left_arm:
            return "💪"
        case .right_arm:
            return "🦾"
        case .left_leg:
            return "🦵"
        case .right_leg:
            return "🦿"
        }
    }
}


struct Tattoo: Codable, Identifiable {
    var id: String?
    var description = ""
    var location: Location = .torso
    var notes = ""
    
    static let example = Tattoo(description: "Mom", location: .face, notes: "Stay Swifty!")
}
