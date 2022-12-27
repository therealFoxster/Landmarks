//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Huy Bui on 2022-12-25.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false // State should always be private since it's only used by the current view and its subviews.
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            // If showFavoritesOnly is false, "!" makes it true and no landmarks get filtered out.
            // If showFavoritesOnly is true, "!" makes it false and only landmarks where isFavorite is true gets through the filter.
        }
    }
    
    var body: some View {
        NavigationView {
            List() {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) // Landmark conforms to Identifiable so no need for id:.
                { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
//                    NavigationLink(destination: {
//                        LandmarkDetail()
//                    }, label: {
//                        LandmarkRow(landmark: landmark)
//                    })
                }
            }
            .navigationTitle("Landmarks")
        }
        .listStyle(.plain) // Default is insetGrouped (?) with rounded corners.
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
//        ForEach(["iPhone SE (3rd generation)", "iPhone 14 Pro"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
