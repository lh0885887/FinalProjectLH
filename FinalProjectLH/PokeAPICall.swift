//
//  PokeAPICall.swift
//  FinalProjectLH
//
//  Created by HILL, LOGAN on 5/5/25.
//

import Foundation

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

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }

    let decoded = try JSONDecoder().decode(Pokemon.self, from: data)
    return decoded
}
