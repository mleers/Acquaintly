//
//  ImagePlaceholder.swift
//  Acquaintly
//
//  Created by Mitch on 12/21/22.
//

import SwiftUI

struct ImagePlaceholder: View {
    let color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                    color,
                    style: .init(
                        lineWidth: 2,
                        lineCap: .round,
                        dash: [5, 5])
                )
                .scaledToFit()
            
            Text("Tap to select an image")
                .foregroundColor(color)
                .font(.headline)
        }
    }
}

struct ImagePlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholder(color: .blue)
    }
}
