//
//  CodableBundleExtension.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ jsonString: String) -> T {
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Failed to convert JSON string to data:\n\(jsonString)")
        }

        let decoder = JSONDecoder()
        do {
            let loaded = try decoder.decode(T.self, from: jsonData)
            return loaded
        } catch {
            fatalError("Failed to decode JSON data:\n\(error)\njsonData:\(jsonData)")
        }
    }
}
