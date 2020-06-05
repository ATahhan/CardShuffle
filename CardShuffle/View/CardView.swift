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
    
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: .degrees(-90), endAngle: .degrees(20))
                    .padding(4).opacity(0.4)
                Text(card.content)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .font(fontSize(forGeometrySize: size))
        }
    }
    
    // MARK: - Constants
    
    private func fontSize(forGeometrySize size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.7)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            card: MemoryGame<String>.Card(
                id: 0,
                isFaceUp: true,
                isMatched: false,
                content: "🥮"
            )
        ).frame(maxWidth: 80)
    }
}
