//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Marcelo Moresco on 27/01/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            //
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("***ID**: \(vm.pokemonDetail?.id ?? 0)")
                Text("***WEIGHT**: \(vm.formatHeightWeight(value: vm.pokemonDetail?.weight ?? 0)) KG")
                Text("***HEIGHT**: \(vm.formatHeightWeight(value: vm.pokemonDetail?.height ?? 0)) M")

            }
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon(name: "marcelo", url: " 1231321")).environmentObject(ViewModel())
}
