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
                    if (character.status == "Alive") {
                        (Text(Image(systemName: "circle.fill")) + Text(" \(character.status)"))
                            .foregroundColor(.green)
                    } else if (character.status == "Dead") {
                        (Text(Image(systemName: "circle.fill")) + Text(" \(character.status)"))
                            .foregroundColor(.red)
                    } else {
                        (Text(Image(systemName: "circle.fill")) + Text(" \(character.status)"))
                            .foregroundColor(.gray)
                    }
                    Text("Species: \(character.species)")
                        .foregroundColor(.secondary)
                    Text("Gender: \(character.gender)")
                        .foregroundColor(.secondary)
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
