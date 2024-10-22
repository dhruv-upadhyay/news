//
//  NewsApp.swift
//  News
//
//  Created by Dhruv Upadhyay on 14/10/24.
//

import SwiftUI

@main
struct NewsApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            if showSplash {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                NewsListView()
            }
            
        }
    }
}
