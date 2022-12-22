//
//  LocationLabel.swift
//  Acquaintly
//
//  Created by Mitch on 12/22/22.
//

import SwiftUI

struct LocationLabel: View {
    enum LocationMetStatus {
        case known, unknown
    }
    
    let title: String
    let status: LocationMetStatus
    
    var systemImage: String {
        status == .known ? "map" : "questionmark"
    }
    
    var body: some View {
        Label(title, systemImage: systemImage)
    }
}

struct LocationLabel_Previews: PreviewProvider {
    static var previews: some View {
        LocationLabel(title: "Here's where you met them", status: .known)
    }
}
