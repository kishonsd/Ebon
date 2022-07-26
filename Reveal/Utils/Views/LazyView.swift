//
//  LazyView.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
