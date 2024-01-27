//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Marcelo Moresco on 27/01/24.
//

import Foundation


class PokemonManager {
    
    func getPokemon()->[Pokemon]{
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        return pokemon
    }
    
    func getDetailPokemon(id: Int, _ completion: @escaping (PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }

    }
}
