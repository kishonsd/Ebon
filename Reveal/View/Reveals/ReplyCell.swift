//
//  ReplyCell.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI

struct ReplyCell: View {
    let reveal: Reveal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray)
                
                Text("replying to")
                    .foregroundColor(.gray)
                
                Text("@\(reveal.replyingTo ?? "")")
                    .foregroundColor(.blue)
            }
            .padding(.leading)
            .font(.system(size: 12))
            
            RevealCell(reveal: reveal)
        }
    }
}
