//
//  MyPlayground.swift
//  Tester
//
//  Created by Erik Kuipers on 16.01.24.
//

import SwiftUI

struct MyPlayground: View {
    
    @State private var expandedViewIndex: Int? = nil
    
    var body: some View {
        VStack {
            
            Text("Text & Typography, a visual guide")
                .frame(width: 220)
                .border(.black)
                .multilineTextAlignment(.leading)
            
        }
            
    }
}
#Preview {
    MyPlayground()
}



