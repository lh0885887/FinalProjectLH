//
//  PokemonView.swift
//  FinalProjectLH
//
//  Created by HILL, LOGAN on 5/7/25.
//

import SwiftUI

struct PokemonView: View {
    @Binding var pokemonName: String
    @Binding var favorites: [String] // bind Favorites array
    @State private var pokemon: Pokemon?
    @State private var error: String?


    var body: some View {
        VStack {
            if let pokemon = pokemon {
                Text("Name: \(pokemon.name.capitalized)")
                    .font(.title)
                Text("ID: \(pokemon.id)")
                Text("Height: \(pokemon.height)'")
                Text("Weight: \(pokemon.weight) lbs")
                
                // Favorite button
                Button("Favorite this Pokémon") {
                    favorites.append(pokemon.name.capitalized)
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            } else if let error = error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                Text("Loading...")
            }
        }
        .task {
            
//          clear out currently stored data before each new fetch
            pokemon = nil
            error = nil
            
            do {
                pokemon = try await fetchPokemonFromAPI(named: pokemonName)
            } catch {
                self.error = "Could not find a Pokémon named '\(pokemonName)'."
            }
        }
    }
}
