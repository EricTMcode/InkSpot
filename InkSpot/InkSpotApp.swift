//
//  InkSpotApp.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import SwiftUI

@main
struct InkSpotApp: App {
    @StateObject var tatooListVM = TatooListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TatooListView()
                .environmentObject(tatooListVM)
        }
    }
}
