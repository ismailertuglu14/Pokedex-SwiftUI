//
//  ContentView.swift
//  Pokedex
//
//  Created by Federico on 19/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pokemonListViewModel = PokemonListViewModel()
    
    var body: some View {
        NavigationView {
           
                List {
                    
                    ForEach(pokemonListViewModel.searchText == "" ? pokemonListViewModel.pokemonList : pokemonListViewModel.pokemonList.filter({
                        $0.name.contains(pokemonListViewModel.searchText.lowercased())
                    })){ pokemon in
                        HStack{
                            PokemonCard(imageUrl: pokemon.url)
                            NavigationLink(destination:                         Text(pokemon.name.capitalizeFirstLetter())
                                           , label: {
                                
                                Text(pokemon.name.capitalizeFirstLetter())

                            })
                        }
                            
                        
                    }
                }.onAppear {
                    pokemonListViewModel.getPokemonList()
                }
                .searchable(text: $pokemonListViewModel.searchText)
                .navigationTitle("Pokedex")
           
        
        }
    }
}

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.dropFirst()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
