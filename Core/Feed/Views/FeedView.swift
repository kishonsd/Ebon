//
//  FeedView.swift
//  Reveal
//
//  Created by kishon daniels on 7/1/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewRevealView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.reveals) { reveal in
                        RevealsRowView(reveal: reveal)
                            .padding()
                    }
                }
            }
            Button {
                showNewRevealView.toggle()
            } label: {
                Image("Reveal-50")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewRevealView) {
                NewRevealView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
