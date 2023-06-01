//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Thomas Garayua on 5/16/23.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var episdoe: [Episode] = []

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
                    for obj in self.characters {
                        self.fetchfirstEpisode(url: obj.episode.first ?? "")
                        return
                        
                        print(obj.name)
                        print(obj.episode.first)
                    }
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchfirstEpisode(url: String) {
        guard let url = URL(string: url) else {
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
                let response = try decoder.decode(APIResponse<Episode>.self, from: data)
                DispatchQueue.main.async {
                    self.episdoe = response.results
                    for obj in self.characters {
                        print(obj.name)
                        print(obj.episode.first)
                    }
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


