//
//  TatooListView.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject private var tattooVM: TatooListViewModel
    @State private var sheetIsPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tattooVM.tattos, id: \.self) { tattoo in
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
                .onDelete(perform: tattooVM.deleteTattoo)
                .onMove(perform: tattooVM.moveTattoo)
            }
            .listStyle(.plain)
            .navigationTitle("Tattoo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(tattoo: Tattoo())
                }
            }
        }
    }
}

struct TatooListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(TatooListViewModel())
    }
}
