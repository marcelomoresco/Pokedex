//
//  ContentView.swift
//  Pokedex
//
//  Created by Marcelo Moresco on 27/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var adaptativeColumn  = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptativeColumn, spacing: 10){
                    ForEach(vm.filterPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: vm.filterPokemon.count)
                .navigationTitle("Pokemon")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
