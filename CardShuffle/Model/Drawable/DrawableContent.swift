//
//  DrawableContent.swift
//  CardShuffle
//
//  Created by Ammar Altahhan on 06/06/2020.
//  Copyright © 2020 Ammar Altahhan. All rights reserved.
//

import SwiftUI

public protocol DrawableContent {
    associatedtype Body : View

    var drawable: Self.Body { get }
}


extension String: DrawableContent {
    public var drawable: some View {
        Text(self)
    }
}


extension UIImage: DrawableContent {
    public var drawable: some View {
        Image(uiImage: self)
    }
}
