//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Huy Bui on 2022-12-28.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
            // Render in a frame of 300 x 300.
                .frame(width: 300, height: 300)
            // Scale rendered result down.
                .scaleEffect(1.0 / 3.0)
            // Place in smaller frame.
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
