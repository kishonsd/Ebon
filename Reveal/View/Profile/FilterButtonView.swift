//
//  FilterButtonView.swift
//  Reveal
//
//  Created by kishon daniels on 7/26/22.
//

import SwiftUI

enum RevealFilterOptions: Int, CaseIterable {
    
    case reveals
    case replies
    case likes
    
    var title: String {
        switch self {
        case .reveals: return "Reveals"
        case .replies: return "Reveals & Replies"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    
    @Binding var selectedOption: RevealFilterOptions
    @State private var showFilter = false
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(RevealFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(RevealFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(RevealFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth - 8)
                    })
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring(response: 1.5), value: showFilter)
        }
    }
}
