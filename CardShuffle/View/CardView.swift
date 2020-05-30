//
//  CardView.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 26/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeLineWidth)
                Text(card.content)
            } else if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(fontSize(forGeometrySize: size))
    }
    
    // MARK: - Constants
    
    let cornerRadius: CGFloat = 10
    let strokeLineWidth: CGFloat = 2
    var aspectRatio: CGFloat { 2/3 }
    func fontSize(forGeometrySize size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.75)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card:
            MemoryGame<String>.Card(
                id: 0,
                isFaceUp: true,
                isMatched: false,
                content: "🥮"
            )
        ).frame(maxWidth: 80)
    }
}
