//
//  Grid.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 28/05/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, Item: Equatable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, nearAspectRatio: self.nearestAspectRatio, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: items.firstIndex(where: {$0 == item}) ?? 0))
    }
    
    // MARK: - Constants
    
    var nearestAspectRatio: Double { 2/3 }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid([
            MemoryGame<String>.Card(id: 0, content: "👻"),
            MemoryGame<String>.Card(id: 0, content: "👻"),
            MemoryGame<String>.Card(id: 0, content: "👻"),
            MemoryGame<String>.Card(id: 0, content: "👻"),
            MemoryGame<String>.Card(id: 0, content: "👻"),
            MemoryGame<String>.Card(id: 0, content: "👻")
        ]) { (item) -> CardView in
            CardView(card: item)
        }
    }
}
