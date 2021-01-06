//
//  UserData.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 27/12/20.
//

import SwiftUI
import Combine


func readJSONResource<T: Decodable>(filename: String) -> T {
    let filePath = Bundle.main.path(forResource: filename, ofType: "json")!
    let fileContents = try! String(contentsOfFile: filePath, encoding: .utf8).data(using: .utf8)!
    
    let decoder = JSONDecoder()
    let parsedData = try! decoder.decode(T.self, from: fileContents)
    return parsedData
}


final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks: [Landmark] = readJSONResource(filename: "landmarkData")
    let hikes: [Hike] = readJSONResource(filename: "hikeData")
    @Published var profile = Profile.default
}
