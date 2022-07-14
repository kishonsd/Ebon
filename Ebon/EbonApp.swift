//
//  EbonApp.swift
//  Ebon
//
//  Created by kishon daniels on 7/1/22.
//

import SwiftUI
import Firebase

@main
struct EbonApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }
        }
    }
}
