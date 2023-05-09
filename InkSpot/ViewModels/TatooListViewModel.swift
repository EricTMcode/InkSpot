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
        loadData()
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
        saveData()
    }
    
    func deleteTattoo(indexSet: IndexSet) {
        tattooArray.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveTattoo(fromOffsets: IndexSet, toOffset: Int) {
        tattooArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    //MARK: - DOCUMENTS DIRECTORY
    
    let path = URL.documentsDirectory.appending(component: "tattooArray")
    
    func saveData() {
        let data = try? JSONEncoder().encode(tattooArray)
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            tattooArray = try JSONDecoder().decode([Tattoo].self, from: data)
        } catch {
            saveData()
        }
    }
}
