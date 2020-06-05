//
//  EmojiMemoryGameView.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text(viewModel.title)
                    .font(.system(size: 32, weight: .black))
                Text("Current Score: \(viewModel.currentScore)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(viewModel.color)
                    .frame(minWidth: 300)
            }
            Group {
                if !viewModel.isPlaying {
                    Button("New Game") {
                        self.viewModel.startNewGame()
                    }
                    .frame(width: 180, height: 55)
                    .foregroundColor(.white)
                    .background(viewModel.color)
                    .cornerRadius(cornerRadius)
                    .font(.headline)
                } else {
                    Grid(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            self.viewModel.choose(card: card)
                        }
                        .padding(4)
                    }
                    .foregroundColor(viewModel.color)
                }
            }
        }
        .padding()
    }
    
    // MARK: - Constants
    
    private let cornerRadius: CGFloat = 8
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(themeProvider: EmojiMemoryGameThemeProvider.plants)
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
