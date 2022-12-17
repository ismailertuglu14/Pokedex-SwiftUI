//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by İsmail Ertuğlu on 17.12.2022.
//

import Foundation

protocol IPokemonListViewModel {
    func getPokemonList() -> Void
}

class PokemonListViewModel: IPokemonListViewModel, ObservableObject {
    @Published var searchText = ""
    @Published var pokemonList = [PokemonEntry]()
    @Published var isLoading = false
    
    
    func getPokemonList() -> Void {
        changeIsLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            PokeApi().getData() { pokemon in
                self.pokemonList = pokemon
            }
            self.changeIsLoading()
        })
        
    }
    
    func changeIsLoading(){
        isLoading.toggle()
    }
    
}
