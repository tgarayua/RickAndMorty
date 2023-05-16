//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Thomas Garayua on 5/13/23.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
