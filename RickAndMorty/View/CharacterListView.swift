//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Thomas Garayua on 5/16/23.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var characterViewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            List(characterViewModel.characters) { character in
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: character.image))
                    Text(character.name)
                        .font(.title)
                    Text(character.species)
                        .foregroundColor(.secondary)
                    Text(character.status)
                        .foregroundColor(.secondary)
                    // Add more views to display other character properties
                }
                .padding()
            }
            .navigationTitle("Characters")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
