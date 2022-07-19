//
//  NewRevealView.swift
//  Reveal
//
//  Created by kishon daniels on 7/3/22.
//

import SwiftUI
import Kingfisher

struct NewRevealView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadRevealViewModel()
    
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
                    viewModel.uploadReveal(withCaption: caption)
            }   label: {
                 Text("Reveal")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
               }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle() )
                       .frame(width: 64, height: 64)
                }
                
                TextArea("What's Happening", text: $caption )
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadReveal) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewrevealView_Previews: PreviewProvider {
    static var previews: some View {
        NewRevealView()
    }
}
