//
//  NavigationView.swift
//  Tester
//
//  Created by Erik Kuipers on 01.12.23.
//

import Foundation

class NavigationManager: ObservableObject {
    @Published private(set) var viewStack: [ViewName] = [.mainMenu]
    @Published private(set) var lastUpdated = UUID()

    var currentView: ViewName {
        viewStack.last ?? .mainMenu
    }
    
    enum ViewName {
        case mainMenu
        case languaRec
        case scrollMot

    }
    
    func push(_ view: ViewName) {
        viewStack.append(view)
    }
    
    func pop() {
        _ = viewStack.popLast()
    }
    
    func navigateTo(_ view: ViewName) {
        viewStack.removeAll()
        viewStack.append(view)
        lastUpdated = UUID()
    }

    
    
}
