//
//  TatooListView.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject private var tattooVM: TatooListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tattooVM.tattos) { tattoo in
                    NavigationLink {
                        DetailView(tattoo: tattoo)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(tattoo.location)
                                Text(tattoo.description)
                            }
                            .font(.title)
                            Text(tattoo.notes)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Tattoo")
        }
    }
}

struct TatooListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(TatooListViewModel())
    }
}
