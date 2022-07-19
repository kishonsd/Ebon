//
//  FeedView.swift
//  Reveal
//
//  Created by kishon daniels on 7/1/22.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewrevealView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 20, id: \.self) { _ in
                     revealsRowView()
                        .padding()
                 }
               }
            }
            Button {
                showNewrevealView.toggle()
            } label: {
                Image("reveal")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewrevealView) {
                NewRevealView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
