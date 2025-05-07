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
    let lowercaseName = name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(lowercaseName)/") else {
        throw URLError(.badURL)
    }
    
    print("Fetching Pokemon data for: \(lowercaseName)")
    print("Fetching data from \(url.absoluteString)")
    

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }

    return try JSONDecoder().decode(Pokemon.self, from: data)
}


