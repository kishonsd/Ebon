//
//  EditProfileViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI

class EditProfileViewModel: ObservableObject{
    let user: User
    
    init(user: User) {
        self.user = user
    }
}

enum EditProfileOptions: Int, CaseIterable {
    case fullname
    case username
    case bio
    
    var description: String {
        switch self {
        case .fullname:
            return "Full Name"
        case .username:
            return "Username"
        case .bio:
            return "Bio"
        }
    }
    
    func optionValue(user: User) -> String {
        switch self {
        case .fullname:
            return user.fullname
        case .username:
            return user.username
        case .bio:
            return user.bio ?? "Enter your bio"
        }
    }
    
}
