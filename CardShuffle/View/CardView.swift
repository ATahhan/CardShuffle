//
//  CardView.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let cornerRadius: CGFloat = 10
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke()
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            card: MemoryGame<String>.Card(id: 0, isFaceUp: true, isMatched: false, content: "🥮")
        ).frame(maxWidth: 80)
    }
}
