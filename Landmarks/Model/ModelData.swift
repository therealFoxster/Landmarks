//
//  ModelData.swift
//  Landmarks
//
//  Created by Huy Bui on 2022-12-21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json") // hikes will not be modified after initial load so no need for @Published attribute.
    @Published var profile = Profile.default
    
    var categories: [String: [Landmark]] {
        // Dictionary with category names as keys and array of associated landmarks as values
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}

func load<T: Decodable>(_ filename: String) -> T { // Returns type T object that conforms to Decodable.
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Unable to find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}
