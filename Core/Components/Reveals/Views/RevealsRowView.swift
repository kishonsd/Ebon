//
//  revealsRowView.swift
//  Reveal
//
//  Created by kishon daniels on 7/1/22.
//

import SwiftUI
import Kingfisher

struct RevealsRowView: View {
    @ObservedObject var viewModel: RevealRowViewModel
    
    init(reveal: Reveal) {
        self.viewModel = RevealRowViewModel(reveal: reveal)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            //Profile image and user info and reveal
            if let user = viewModel.reveal.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    
                // User info and reveal caption
                    VStack(alignment: .leading, spacing: 4) {
                        
                    //User info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                                 
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                        }
        
                    //reveal caption
                        Text(viewModel.reveal.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    }
                }
            }
            //Action buttons
            HStack {
                Button {
                    //Action goes here
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //Action goes here
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //Action goes here
                    viewModel.reveal.didLike ?? false ?
                    viewModel.unlikeReveal() :
                    viewModel.likeReveal()
                } label: {
                    Image(systemName: viewModel.reveal.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.reveal.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    //Action goes here
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        
    }
        
}

//struct revealsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//       revealsRowView()
//    }
// }
