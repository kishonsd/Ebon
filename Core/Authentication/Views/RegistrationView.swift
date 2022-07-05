//
//  RegistrationView.swift
//  Ebon
//
//  Created by kishon daniels on 7/4/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
      VStack{
          AuthHeaderView(title1: "Hey,", title2: "Let's get your account created.")
          VStack(spacing: 40) {
              CustomInputField(imageName: "envelope",
                                placeholderText: "Email",
                                text: $email)
              
              CustomInputField(imageName: "person",
                                placeholderText: "Username",
                                text: $password)
              
              CustomInputField(imageName: "lock",
                                placeholderText: "Password",
                                text: $email)
              CustomInputField(imageName: "lock",
                                placeholderText: "Confirm Password",
                                text: $email)
          }
          .padding(32)
          
          Spacer()
       }
      .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
