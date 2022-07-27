//
//  NewRevealView.swift
//  Reveal
//
//  Created by kishon daniels on 7/3/22.
//

import SwiftUI
import Kingfisher

struct NewRevealView: View {
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    @ObservedObject var viewModel: UploadRevealViewModel
    
    var reveal: Reveal?
    
    init(isPresented: Binding<Bool>, reveal: Reveal?) {
        self._isPresented = isPresented
        self.viewModel = UploadRevealViewModel(isPresented: isPresented, reveal: reveal)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { isPresented.toggle() }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                })
                Spacer()
                
                Button(action: { viewModel.uploadReveal(caption: captionText) }, label: {
                    Text("Reveal")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
            }.padding()
            
            if let reveal = reveal {
                HStack {
                    Text("Replying to")
                        .foregroundColor(.gray)
                    Text("@\(reveal.username)")
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .font(.system(size: 14))
                .padding(.leading)
            }
            
            HStack(alignment: .top) {
                KFImage(viewModel.profileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .cornerRadius(32)
                
                TextArea(viewModel.placeholderText, text: $captionText)
                
                Spacer()
            }.padding()
            Spacer()
        }
    }
}
