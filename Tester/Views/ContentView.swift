//
//  ContentView.swift
//  Tester
//
//  Created by Erik Kuipers on 17.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    
    var body: some View {
        
        Group {
            switch navigationManager.currentView {
                
            case .languaRec:
                LangRecognizerView()
                    .environmentObject(navigationManager)
                
            case .scrollMot:
                ScrollMotion()
                    .environmentObject(navigationManager)
                
            case .mainMenu:
                MainMenu()
                    .environmentObject(navigationManager)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
