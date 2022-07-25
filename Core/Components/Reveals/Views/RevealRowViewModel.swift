//
//  RevealRowViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/19/22.
//

import Foundation


class RevealRowViewModel: ObservableObject {
    @Published var reveal: Reveal
    private let service = RevealService()
    
    init(reveal: Reveal) {
        self.reveal = reveal
        checkIfUserLikedReveal()
    }
    
    func likeReveal() {
        service.likeReveal(reveal) {
            self.reveal.didLike = true
        }
    }
    
    func unlikeReveal() {
        service.unlikeReveal(reveal) {
            self.reveal.didLike = false
        }
    }
    
    func checkIfUserLikedReveal() {
        service.checkIfUserLikedReveal(reveal) { didLike in
            if didLike {
                self.reveal.didLike = true
            }
        }
    }
}
