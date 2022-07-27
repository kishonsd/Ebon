//
//  RevealActionViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI
import Firebase

class RevealActionViewModel: ObservableObject {
    let reveal: Reveal
    @Published var didLike = false
    
    init(reveal: Reveal) {
        self.reveal = reveal
        checkIfUserLikedReveal()
    }
    
    func likeReveal() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let revealLikesRef = COLLECTION_REVEALS.document(reveal.id).collection("reveal-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_REVEALS.document(reveal.id).updateData(["likes": reveal.likes + 1]) { _ in
            revealLikesRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.reveal.id).setData([:]) { _ in
                    self.didLike = true
                    NotificationViewModel.uploadNotification(toUid: self.reveal.uid, type: .like, reveal: self.reveal)
                }
            }
        }
    }
    
    func unlikeReveal() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let revealLikesRef = COLLECTION_REVEALS.document(reveal.id).collection("reveal-likes")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        COLLECTION_REVEALS.document(reveal.id).updateData(["likes": reveal.likes - 1]) { _ in
            revealLikesRef.document(uid).delete { _ in
                userLikesRef.document(self.reveal.id).delete { _ in
                    self.didLike = false
                    
                    NotificationViewModel.deleteNotification(toUid: self.reveal.uid, type: .like, revealId: self.reveal.id)
                }
            }
        }
    }
    
    func checkIfUserLikedReveal() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes").document(reveal.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
}


