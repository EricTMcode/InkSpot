//
//  TatooListViewModel.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import Foundation

class TatooListViewModel: ObservableObject {
    @Published var tattooArray: [Tattoo] = []
    
    init() {
        tattooArray = [Tattoo(description: "Mom", location: "💪", notes: "Stay Swifty!"),
                  Tattoo(description: "Thug Life", location: "👕", notes: "In memory of Tupac!")]
    }
    
    func saveTattoo(tattoo: Tattoo) {
        if tattoo.id == nil {
            var newTattoo = tattoo
            newTattoo.id = UUID().uuidString
            tattooArray.append(newTattoo)
        } else {
            if let index = tattooArray.firstIndex(where: { $0.id == tattoo.id }) {
                tattooArray[index] = tattoo
            }
        }
    }
    
    func deleteTattoo(indexSet: IndexSet) {
        tattooArray.remove(atOffsets: indexSet)
    }
    
    func moveTattoo(fromOffsets: IndexSet, toOffset: Int) {
        tattooArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
