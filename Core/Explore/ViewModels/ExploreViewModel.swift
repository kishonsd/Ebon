//
//  ExploreViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/18/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
        
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
        
    }
}
