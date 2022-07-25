//
//  ProfileViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/19/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var reveals = [Reveal]()
    @Published var likedReveals = [Reveal]()
    
    private let service = RevealService()
    private let userService = UserService()
    let user: User
      
    init(user: User) {
        self.user = user
        self.fetchUserReveals()
        self.fetchLikedReveals()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func reveals(forFilter filter: RevealFilterViewModel) -> [Reveal] {
        switch filter {
        case .reveals:
            return reveals
        case .replies:
            return reveals
        case .likes:
            return likedReveals
        }
    }
    
     func fetchUserReveals() {
        guard let uid = user.id else { return }
        service.fetchReveals(forUid: uid) { reveals in
            self.reveals = reveals
            
            for i in 0 ..< reveals.count  {
                self.reveals[i].user = self.user
            }
        }
    }
    
    func fetchLikedReveals() {
        guard let uid = user.id else { return }
        
        service.fetchLikedReveals(forUID: uid) { reveals in
            self.likedReveals = reveals
            
            for i in 0 ..< reveals.count {
                let uid = reveals[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedReveals[i].user = user
                }
            }
        }
    }
}
