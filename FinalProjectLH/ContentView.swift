////
////  ContentView.swift
////  FinalProjectLH
////
////  Created by HILL, LOGAN on 5/5/25.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var pokemon: Pokemon?
//    @State private var error: String?
//
//    var body: some View {
//        VStack {
//            if let pokemon = pokemon {
//                Text("Name: \(pokemon.name.capitalized)")
//                Text("ID: \(pokemon.id)")
//                Text("Height: \(pokemon.height)")
//                Text("Weight: \(pokemon.weight)")
//            } else if let error = error {
//                Text("Error: \(error)")
//            } else {
//                Text("Loading...")
//            }
//        }
//        .task {
//            do {
//                pokemon = try await fetchPokemonFromAPI()
//            } catch {
//                self.error = error.localizedDescription
//            }
//        }
//    }
//}
//
//
//#Preview {
//    ContentView()
//}
