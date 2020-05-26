//
//  GameView.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

struct GameView: View {
    var viewModel: EmojiMemoryGame
    
    var font: Font {
        viewModel.cards.count / 2 > 4
            ? Font.body
            : Font.largeTitle
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(font)
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: EmojiMemoryGame())
    }
}
