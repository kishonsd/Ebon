//
//  RevealDetailView.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI
import Kingfisher

struct RevealDetailView: View {
    let reveal: Reveal
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: reveal.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(reveal.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(reveal.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Text(reveal.caption)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("0")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
            }
            Divider()
            
            RevealActionsView(reveal: reveal)
            
            Spacer()
        }
        .padding()
    }
}
