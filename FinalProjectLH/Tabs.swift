//
//  Tabs.swift
//  FinalProjectLH
//
//  Created by HILL, LOGAN on 5/5/25.
//

import SwiftUI

struct Tabs: View {
    @State var pokemonName: String = ""
    @State private var pokemon: Pokemon?
    @State private var error: String?
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house")
            {
                Text("Enter the name of a Pokemon to view it's information:")
                TextField("Enter Pokemon Name", text: $pokemonName).padding(20)

//              Shows warning message only after typing in TextField
                if (pokemonName != "") {
                    Text("Make sure '\(pokemonName)' is spelled correctly or the program will not work!")
                }
            }
            
            
            
            
            
            
            Tab("Pokemon", systemImage: "gamecontroller.circle")
            {
                    VStack {
                        if let pokemon = pokemon {
                            Text("Name: \(pokemon.name.capitalized)")
                            Text("ID: \(pokemon.id)")
                            Text("Height: \(pokemon.height)'")
                            Text("Weight: \(pokemon.weight) lbs")
                        } else if let error = error {
                            Text("Error: \(error)")
                        } else {
                            Text("Loading...")
                        }
                    }
                    .task {
                        do {
                            pokemon = try await fetchPokemonFromAPI()
                        } catch {
                            self.error = error.localizedDescription
                        }
                    }
                }
            }
        }
    }

#Preview {
    Tabs()
}
