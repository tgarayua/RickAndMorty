//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Thomas Garayua on 5/16/23.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    init() {
        fetchCharacters()
    }

    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data available")
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(APIResponse<Character>.self, from: data)
                DispatchQueue.main.async {
                    self.characters = response.results
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct APIResponse<T: Codable>: Codable {
    let results: [T]
}
