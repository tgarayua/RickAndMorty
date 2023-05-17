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
                        (Text(Image(systemName: "circle.fill")).foregroundColor(.green) + Text(" ") + Text(character.status) + Text(" - ") + Text(character.species))
                    } else if (character.status == "Dead") {
                        (Text(Image(systemName: "circle.fill")).foregroundColor(.red) + Text(" ") + Text(character.status) + Text(" - ") + Text(character.species))
                    } else {
                        (Text(Image(systemName: "circle")).foregroundColor(.gray) + Text(" ") + Text(character.status) + Text(" - ") + Text(character.species))
                    }
                    Text("Last Known Location: ").foregroundColor(.secondary)
                    Text(character.location.name)
                    Text("First Seen In: ").foregroundColor(.secondary)
                    // Add more views to display other character properties
                }
                .padding()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
