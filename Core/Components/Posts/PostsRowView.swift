//
//  revealsRowView.swift
//  Reveal
//
//  Created by kishon daniels on 7/1/22.
//

import SwiftUI

struct revealsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //Profile image and user info and reveal
            HStack(alignment: .top, spacing: 12) {
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(Color(.systemBlue))
                
            // User info and reveal caption
                VStack(alignment: .leading, spacing: 4) {
                //User info
                HStack {
                    Text("Bruce Wayne")
                        .font(.subheadline).bold()
                    
                    Text("batman")
                        .foregroundColor(.gray)
                        .font(.caption)
                         
                    Text("2w")
                        .foregroundColor(.gray)
                        .font(.caption)
                    
                }
                
                //reveal caption
                
                Text("I believe in Harvey Dent")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
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
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
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

struct revealsRowView_Previews: PreviewProvider {
    static var previews: some View {
        revealsRowView()
    }
}
