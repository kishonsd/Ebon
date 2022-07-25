//
//  revealFilterViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/2/22.
//

import Foundation

enum RevealFilterViewModel: Int, CaseIterable {
    case reveals
    case replies
    case likes
    
    var title: String {
        switch self {
        case .reveals: return "Reveals"
        case .replies: return "Replies"
        case .likes: return "Likes"
            
        }
    }
}
