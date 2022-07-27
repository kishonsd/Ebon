//
//  RevealCell.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI
import Kingfisher

struct RevealCell: View {
    let reveal: Reveal
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                KFImage(URL(string: reveal.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(reveal.fullname)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@\(reveal.username) •")
                            .foregroundColor(.gray)
                        
                        Text(reveal.timestampString)
                            .foregroundColor(.gray)
                    }
                    
                    Text(reveal.caption)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            RevealActionsView(reveal: reveal)
            
            Divider()
        }
        .padding(.leading, -16)
    }
}

