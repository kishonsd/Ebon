//
//  NewPostView.swift
//  Ebon
//
//  Created by kishon daniels on 7/3/22.
//

import SwiftUI

struct NewPostView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss() 
            } label: {
                  Text("Cancel")
                    .foregroundColor(Color(.systemBlue))
               }
                
                Spacer()
                
                Button {
                  print("Post")
            }   label: {
                 Text("Post")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
               }
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                   .frame(width: 64, height: 64)
                
                TextArea("What's Happening", text: $caption )
            }
            .padding()
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
