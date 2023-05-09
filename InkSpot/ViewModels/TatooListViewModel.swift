//
//  TatooListViewModel.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import Foundation

class TatooListViewModel: ObservableObject {
    @Published var tattos: [Tattoo] = []
    
    init() {
        tattos = [Tattoo(description: "Mom", location: "💪", notes: "Stay Swifty!"),
                  Tattoo(description: "Thug Life", location: "👕", notes: "In memory of Tupac!")]
    }
    
    func deleteTattoo(indexSet: IndexSet) {
        tattos.remove(atOffsets: indexSet)
    }
    
    func moveTattoo(fromOffsets: IndexSet, toOffset: Int) {
        tattos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
