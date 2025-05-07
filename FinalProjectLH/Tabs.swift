//
//  Tabs.swift
//  FinalProjectLH
//
//  Created by HILL, LOGAN on 5/5/25.
//

import SwiftUI

struct Tabs: View {
    @State var pokemonName: String = ""
    @State private var selectedTab = 0  // 0 = Home, 1 = Pokemon
    @State private var pokemon: Pokemon?
    @State private var error: String?
    @State private var favorites: [String] = [] // Array to store favorites
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            // Home Tab
            VStack {
                Image("pokeBall")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                Text("Welcome to the PokeAPI Search Application!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .foregroundColor(.red)
                
                Text("Enter the name of a Pokemon to view its information:")
                    .padding()
                    .font(.headline)
                TextField("Enter Pokemon Name", text: $pokemonName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 20)
                    .padding()
                
                if !pokemonName.isEmpty {
                    Text("Make sure '\(pokemonName)' is spelled correctly or the program will not work!")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                        .padding(30)
                }
                
                Button("Search for Pokemon") {
                    selectedTab = 1  // Switch to Pokemon tab
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            .tag(0) // for $selectedTab
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            
            
            // Pokemon Tab
            PokemonView(pokemonName: $pokemonName, favorites: $favorites)
            .tag(1)
            .tabItem {
                Label("Pokemon", systemImage: "gamecontroller.circle")
            }
            
            
            
            // Favorites Tab
            VStack {
                if favorites.isEmpty {
                    Text("No favorites yet. Start by adding one!")
                        .italic()
                        .padding()
                } else {
                    List(favorites, id: \.self) { favorite in
                        Text(favorite)
                    }
                }
            }
            .tag(2)
            .tabItem {
                Label("Favorites", systemImage: "star.fill")
            }
        }
    }
}


#Preview {
    Tabs()
}
