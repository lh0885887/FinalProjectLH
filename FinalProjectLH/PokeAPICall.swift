//
//  PokeAPICall.swift
//  FinalProjectLH
//
//  Created by HILL, LOGAN on 5/5/25.
//

import Foundation
import SwiftUI


struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}

func fetchPokemonFromAPI(named name: String) async throws -> Pokemon {
    let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(cleanedName)/") else {
        throw URLError(.badURL)
    }
    print("Fetching from: \(url)") // Add this line to debug the URL
    
    let (data, response) = try await URLSession.shared.data(from: url)

    if let httpResponse = response as? HTTPURLResponse {
        print("Response status code: \(httpResponse.statusCode)") // Add this to log status code
        if httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
    }
    
    let decoded = try JSONDecoder().decode(Pokemon.self, from: data)
    return decoded
}

