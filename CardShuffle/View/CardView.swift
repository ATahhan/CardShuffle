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
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: .degrees(-90), endAngle: .degrees(-animatedBonusRemaining*360-90))
                            .onAppear {
                                self.startBonusTimeAnimation()
                        }

                    } else {
                        Pie(startAngle: .degrees(-90), endAngle: .degrees(-card.bonusRemaining*360-90))
                    }
                }
                    .padding(4)
                    .opacity(0.4)
                Text(card.content)
                    .font(fontSize(forGeometrySize: size))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : Animation.default)
                
                if card.hasEarnedBonus {
                    Color.clear.overlay (
                        Text("+1")
                            .position(x: size.width / 2, y: 10)
                            .foregroundColor(.green)
                            .font(Font.largeTitle)
                            .modifier(ScaleAndFade())
                    )
                    .animation(Animation.easeOut(duration: self.earnedBonusAnimationTime))
                }
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }
    
    // MARK: - Constants
    
    private let earnedBonusAnimationTime: TimeInterval = 5
    private func fontSize(forGeometrySize size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.7)
    }
    
}

struct ScaleAndFade: AnimatableModifier {
    
    private var percent: Double = 0
    
    var animatableData: Double {
        get { percent }
        set { percent = newValue }
    }
    
    func body(content: Content) -> some View {
        Text("+2")
            .font(.title)
            .opacity(percent < 0.5 ? 1 : 0)
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
