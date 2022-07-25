//
//  FeedViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/18/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var reveals = [Reveal]()
    let service = RevealService()
    let userService = UserService()
    
    init() {
        fetchReveals()
    }
    
    func fetchReveals() {
        service.fetchReveals { reveals in
            self.reveals = reveals
            
            for i in 0 ..< reveals.count {
                let uid = reveals[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.reveals[i].user = user
                }
            }
        }
    }
}
