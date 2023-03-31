//
//  ContentView.swift
//  Challenge3
//
//  Created by Cameron Johnson on 12/12/22.
//

import SwiftUI

struct Pokemon: Codable {
    let name: String
    let stats: [Stat]
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_default: String
}

struct Stat: Codable {
    let base_stat: Int
    
}

struct Response: Codable{
    var results: [Result]
}

struct Result: Codable {
    var pokemonName: String
    var pokemonType: String
    var pokemonAbilities: String
    var pokemonPlacement: Int
    var pokemonDescription: String
}

struct ContentView: View {
    //@State private var results = [Result]()
    @State private var pokemon = Pokemon(name: "N/A", stats: [], sprites: Sprites(front_default: ""))
    @State private var pokemonNumber = 1
    var body: some View {
//        List(results, id: \.pokemonName) {item in
//            VStack (alignment: .leading){
//                Text(item.pokemonName)
//                    .font(.headline)
//                Text(item.pokemonType)
//
//            }
//
//        }
        VStack {
            // Gets the information from the API for the picture
            AsyncImage(url: URL(string: pokemon.sprites.front_default))
            Text(pokemon.name)
            Text(pokemon.stats.description)
            
            Button("Next") {
                pokemonNumber += 1
                Task {
                    await loadData()
                }
            }
        }
        .task{
            await loadData()
        }
    }
    // Pulls the info for each pokemon
    func loadData() async{
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonNumber)") else {
            print("No Pokemon Found")
            return
            
        }
        do {
            let (data, _) = try await URLSession.shared.data(from:url)
            //
            if let decodedResponse = try? JSONDecoder().decode(Pokemon.self, from: data) {
                //results = decodedResponse.results
                pokemon = decodedResponse
            }
        } catch {
            print("Invalid Pokemon")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
