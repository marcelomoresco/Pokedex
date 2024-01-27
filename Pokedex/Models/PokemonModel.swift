//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Marcelo Moresco on 27/01/24.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
}

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
