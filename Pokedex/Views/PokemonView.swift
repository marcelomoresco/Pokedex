//
//  PokemonView.swift
//  Pokedex
//
//  Created by Marcelo Moresco on 27/01/24.
//

import SwiftUI

struct PokemonView: View {
    
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimension: Double = 140

    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonId(pokemon: pokemon)).png ")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimension, height: dimension)
                
            } placeholder: {
                ProgressView()
                    .frame(width: dimension, height: dimension)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size:16, weight: .regular,design: .monospaced))
                    .padding(.bottom,20)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon(name: "", url: "")).environmentObject(ViewModel())
}
