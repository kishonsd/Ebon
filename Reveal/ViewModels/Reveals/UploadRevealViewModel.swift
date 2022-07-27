//
//  UploadRevealViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/18/22.
//

import SwiftUI
import Firebase

enum RevealUploadType {
    case reveal
    case reply(Reveal)
}

class UploadRevealViewModel: ObservableObject {
    @Binding var isPresented: Bool
    var reveal: Reveal?
    let isReply: Bool
    
    init(isPresented: Binding<Bool>, reveal: Reveal?) {
        self._isPresented = isPresented
        self.reveal = reveal
        self.isReply = reveal != nil
    }
    
    var profileImageUrl: URL? {
        guard let urlString = isReply ? reveal?.profileImageUrl : AuthViewModel.shared.user?.profileImageUrl else { return nil }
        return URL(string: urlString)
    }
    
    var placeholderText: String {
        return isReply ? "Reveal your reply..." : "Whats happening?"
    }
    
    func uploadReveal(caption: String) {
        if isReply {
            guard let reveal = reveal else { return }
            upload(caption: caption, type: .reply(reveal))
        } else {
            upload(caption: caption, type: .reveal)
        }
    }
    
    private func upload(caption: String, type: RevealUploadType) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = documentReference(forUploadType: type)
        
        var data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname, "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "likes": 0,
                                   "id": docRef.documentID]
        
        switch type {
        case .reply(let reveal):
            data["replyingTo"] = reveal.username
            
            docRef.setData(data) { _ in
                let userRepliesRef = COLLECTION_USERS.document(user.id).collection("user-replies").document(docRef.documentID)
                userRepliesRef.setData(data) { _ in
                    self.isPresented = false
                    NotificationViewModel.uploadNotification(toUid: reveal.id, type: .reply, reveal: reveal)
                }
            }
        case .reveal:
            docRef.setData(data) { _ in
                self.isPresented = false
            }
        }
    }
    
    private func documentReference(forUploadType type: RevealUploadType) -> DocumentReference {
        let docRef = COLLECTION_REVEALS.document()
        
        switch type {
        case .reply(let reveal):
            return COLLECTION_REVEALS.document(reveal.id).collection("reeval-replies").document(docRef.documentID)
        case .reveal:
            return docRef
        }
    }
}
