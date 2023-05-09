//
//  DetailView.swift
//  InkSpot
//
//  Created by Eric on 09/05/2023.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var tatooListVM: TatooListViewModel
    @State var tattoo: Tattoo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description:")
                .font(.title)
                .bold()
            TextField("Description", text: $tattoo.description)
                .font(.title3)
                .padding(.bottom)
            Divider()
            
            Text("Location:")
                .font(.title)
                .bold()
            TextField("Location", text: $tattoo.location)
                .font(.title3)
                .padding(.bottom)
            Divider()
            
            Text("Notes:")
                .font(.title)
                .bold()
            TextField("Notes", text: $tattoo.notes)
                .font(.title3)
            
            Spacer()
            
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(tattoo: Tattoo.example)
            .environmentObject(TatooListViewModel())
    }
}