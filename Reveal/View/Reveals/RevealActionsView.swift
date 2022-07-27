//
//  RevealActionsView.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import Foundation
import SwiftUI

struct RevealActionsView: View {
    let reveal: Reveal
    @State var isShowingReplyView = false
    @ObservedObject var viewModel: RevealActionViewModel
    
    init(reveal: Reveal) {
        self.reveal = reveal
        self.viewModel = RevealActionViewModel(reveal: reveal)
    }
    
    var body: some View {
        HStack {
            Button(action: { self.isShowingReplyView.toggle() }, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }).sheet(isPresented: $isShowingReplyView, content: {
                NewRevealView(isPresented: $isShowingReplyView, reveal: reveal)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikeReveal() : viewModel.likeReveal()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
        }
        .foregroundColor(.gray)
        .padding(.horizontal)

    }
}
