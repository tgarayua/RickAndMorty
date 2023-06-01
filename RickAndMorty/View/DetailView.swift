//
//  DetailView.swift
//  RickAndMorty
//
//  Created by Thomas Garayua on 6/1/23.
//

import SwiftUI

struct DetailView: View {
    let character: Character
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image))
            Text(character.name)
                .font(.title)
            Text(character.gender)
                .font(.title)
            Text(character.species)
                .font(.title)
            Text(character.status)
                .font(.subheadline)
            // Display more character details in the detail view
        }
        .padding()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(character: Character)
//    }
//}
