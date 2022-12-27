//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Huy Bui on 2022-12-21.
//

import SwiftUI

@main // App entry point.
struct LandmarksApp: App {
    // "Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app."
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
