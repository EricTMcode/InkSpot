//
//  DetailView.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var tattooVM: TattooListViewModel
    @State var tattoo: Tattoo
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description:")
                .bold()
            TextField("Description", text: $tattoo.description)
                .padding(.bottom)
            Divider()
            
            HStack {
                Text("Location:")
                    .bold()
                
                Spacer()
                
                Picker("", selection: $tattoo.location) {
                    ForEach(Location.allCases, id: \.self) { location in
                        Text("\(location.emoji()) \(formatPicker(location: location))")
                            .tag(location)
                    }
                }
            }
            
            Divider()
            
            Text("Notes:")
                .bold()
            TextField("Notes", text: $tattoo.notes, axis: .vertical)
            
            Spacer()
            
        }
        .font(.title2)
        .textFieldStyle(.roundedBorder)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    tattooVM.saveTattoo(tattoo: tattoo)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func formatPicker(location: Location) -> String {
        let formattingString = location.rawValue.replacingOccurrences(of: "_", with: " ")
        return formattingString.capitalized
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(tattoo: Tattoo.example)
                .environmentObject(TattooListViewModel())
        }
    }
}
