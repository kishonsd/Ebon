//
//  revealFilterViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/2/22.
//

import Foundation

enum revealFilterViewModel: Int, CaseIterable {
    case reveals
    case replies
    case likes
    
    var title: String {
        switch self {
        case .reveals: return "reveals"
        case .replies: return "Replies"
        case .likes: return "Likes"
            
        }
    }
}
