//
//  RegistrationView.swift
//  Reveal
//
//  Created by kishon daniels on 7/4/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
      VStack{
          
          NavigationLink(destination: ProfilePhotoSelectorView(),
                         isActive: $viewModel.didAuthenticateUser,
                         label: { } )
          AuthHeaderView(title1: "Hey,", title2: "Let's get your account created.")
          VStack(spacing: 40) {
              CustomInputField(imageName: "envelope",
                                placeholderText: "Email",
                                text: $email)
              
              CustomInputField(imageName: "person",
                                placeholderText: "Username",
                                text: $username)
              
              CustomInputField(imageName: "person",
                                placeholderText: "Full Name",
                                text: $fullname)
              CustomInputField(imageName: "lock",
                               placeholderText: "Password",
                               isSecureField: true,
                               text: $password)
          }
          .padding(32)
          
          Button {
              viewModel.register(withEmail: email,
                                 password: password,
                                 fullname: fullname,
                                 username: username)
          } label: {
              Text("Sign In")
                  .font(.headline)
                  .foregroundColor(.white)
                  .frame(width: 349, height: 50)
                  .background(Color(.systemBlue))
                  .clipShape(Capsule())
                  .padding()
          }
          .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
          
          Spacer()
          
          Button {
              presentationMode.wrappedValue.dismiss()
          } label: {
              Text("Already have an account?")
                  .font(.footnote)
              
              Text("Sign In")
                  .font(.footnote)
                  .fontWeight(.semibold)
          }
          .padding(.bottom, 32)
              
       }
      .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
