//
//  PokemonCard.swift
//  Pokedex
//
//  Created by İsmail Ertuğlu on 17.12.2022.
//

import SwiftUI

struct PokemonCard: View {
    let imageUrl: String
    @State private var image = ""
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: image)).frame(width: 150,height: 75).padding(.trailing,15)
       
        }
            .onAppear{
            let loadedData = UserDefaults.standard.string(forKey: imageUrl)
            if loadedData == nil {
                getSprite(url: imageUrl)
            }else{
                getSprite(url: loadedData!)
            }
        } .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
            .scaledToFit()
    }
    func getSprite(url: String) {
           var tempSprite: String?
           PokemonSelectedApi().getData(url: url) { sprite in
               tempSprite = sprite.front_default
               self.image = tempSprite ?? "https://m.media-amazon.com/images/M/MV5BNDcwZDc2NTEtMzU0Ni00YTQyLWIyYTQtNTI3YjM0MzhmMmI4XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_.jpg"
           }
           
       }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(imageUrl: "")
    }
}
