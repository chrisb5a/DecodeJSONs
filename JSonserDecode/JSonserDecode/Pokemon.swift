//
//  Pokemon.swift
//  JSonserDecode
//
//  Created by Consultant on 7/13/22.
//

import Foundation


// MARK: - Welcome5
struct Pokemon: Decodable {
    let damageRelations: DamageRelations
    let gameIndices: [GameIndex]
    let generation: Generation
    let id: Int
    let moveDamageClass: Generation
    let moves: [Generation]
    let name: String
    let pokemon: [PokemonNameLink]
}

// MARK: - DamageRelations
struct DamageRelations: Decodable {
    let doubleDamageFrom, doubleDamageTo, halfDamageFrom, halfDamageTo: [Generation]
    let noDamageFrom: [String?]
    let noDamageTo: [Generation]
}

// MARK: - Generation
struct Generation: Decodable {
    let name: String
    let url: String
}

// MARK: - GameIndex
struct GameIndex: Decodable {
    let gameIndex: Int
    let generation: Generation
}

// MARK: - Pokemon
struct PokemonNameLink: Decodable {
    let pokemon: Generation
    let slot: Int
}

