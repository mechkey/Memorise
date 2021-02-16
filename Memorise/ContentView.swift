//
//  ContentView.swift
//  Memorise
//
//  Created by Luke on 27/01/2021.
//

import SwiftUI

//This is the view

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
            HStack {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                }
            }
            .aspectRatio(2/3, contentMode: .fit)
            .padding()
            .foregroundColor(Color.orange)
            .font(viewModel.cards.count < 5 ? Font.largeTitle : Font.title)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack(content: {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        })
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
