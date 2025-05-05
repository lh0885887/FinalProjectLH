//
//  PokeAPICall.swift
//  FinalProjectLH
//
//  Created by HILL, LOGAN on 5/5/25.
//

import Foundation
import SwiftUI

// TODO: Figure out where to put this
//@Binding var pokemonName: String

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}

func fetchPokemonFromAPI() async throws -> Pokemon {
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/clefairy/")!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let decoded = try JSONDecoder().decode(Pokemon.self, from: data)
    
    return decoded
}
