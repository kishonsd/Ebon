//
//  UploadRevealViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/18/22.
//

import Foundation


class UploadRevealViewModel: ObservableObject {
    @Published var didUploadReveal = false
    let service = RevealService()
    
    func uploadReveal(withCaption caption: String) {
        service.uploadReveal(caption: caption) { success in
            if success {
                //Dismiss screen
                self.didUploadReveal = true
            } else {
                //Show error message to user
            }
        }
    }
}
