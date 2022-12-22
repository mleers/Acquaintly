//
//  PersonDetailView.swift
//  Acquaintly
//
//  Created by Mitch on 12/21/22.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        VStack(spacing: 20) {
            person.image?
                .resizable()
                .scaledToFit()
        }
        .padding()
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct PersonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonDetailView()
//    }
//}
