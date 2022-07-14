//
//  PostFilterViewModel.swift
//  Reveal
//
//  Created by kishon daniels on 7/2/22.
//

import Foundation

enum PostFilterViewModel: Int, CaseIterable {
    case posts
    case replies
    case likes
    
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Replies"
        case .likes: return "Likes"
            
        }
    }
}
