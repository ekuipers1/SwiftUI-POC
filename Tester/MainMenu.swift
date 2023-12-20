//
//  MainMenu.swift
//  Tester
//
//  Created by Erik Kuipers on 01.12.23.
//

import SwiftUI

import SwiftUI

struct MainMenu: View {
    struct Option {
        var text: String
        var symbolName: String
        var destination: ViewType
    }
    
    enum ViewType {
        case languaRec
        case scrollMot
        case mapView
        case pocView
        
    }
    
    let options = [
        Option(text: "Language Recognition", symbolName: "globe", destination: .languaRec),
        Option(text: "Scroll Motion", symbolName: "scroll", destination: .scrollMot),
        Option(text: "Map view", symbolName: "map", destination: .mapView),
        Option(text: "POC view", symbolName: "questionmark", destination: .pocView),
        // Add more options here
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(options, id: \.text) { option in
                    NavigationLink(destination: destinationView(for: option.destination)) {
                        
                        ZStack(){
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(Color.white)
                                .frame(width: 120, height: 120)
                                .shadow(color: .gray, radius: 3, y: 1)
                                .padding(.top, 20.0)
                            
                            
                            
                            VStack {
                                
                                Image(systemName: option.symbolName)
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1)
                                    .frame(width: 30, height: 30)
                                    .padding(.top, 20.0)
                                Text(option.text)
                                    .padding(.top, 10.0)
                                    .frame(width: 110, height: 60)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func destinationView(for viewType: ViewType) -> some View {
        switch viewType {
        case .languaRec:
            LangRecognizerView()
        case .scrollMot:
            ScrollMotion()
        case .mapView:
            MapView()
        case .pocView:
            pocView()
        }
    }
}

#Preview {
    MainMenu()
}
