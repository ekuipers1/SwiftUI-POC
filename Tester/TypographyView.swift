//
//  TypographyView.swift
//  Tester
//
//  Created by Erik Kuipers on 16.01.24.
//

import SwiftUI

struct TypographyView: View {
    
    @State private var expandedViewIndex: Int? = nil
    
    var body: some View {
        VStack {
            
            Text("Text & Typography, a visual guide")
                .frame(width: 220)
                .border(.black)
                .multilineTextAlignment(.leading)
            
            ScrollView(){
                
                ForEach(0..<8, id: \.self) { index in
                    ChildView(
                        index: index,
                        isExpanded: self.expandedViewIndex == index,
                        header: {
                            // Custom header for each child view
                            if index == 0 {
                                Text("Font Weight")
                            } else if index == 1 {
                                Text("Font design")
                            } else if index == 2 {
                                Text("Text style")
                            } else if index == 3 {
                                Text("Text underline/strikethrough")
                            } else if index == 4 {
                                Text("Text Foreground style")
                            } else if index == 5 {
                                Text("Text Foreground gradient")
                            } else if index == 6 {
                                Text("Text Background")
                            } else if index == 7 {
                                Text("Predefined text styles")
                            }
                            
                            
                            
                            
                            
                        },
                        content: {
                            // Custom content for each child view
                            if index == 0 {
                                VStack(){
                                    Text("ultraLight").font(.system(size: 30, weight: .ultraLight))
                                    Text("thin").font(.system(size: 30, weight: .thin))
                                    Text("light").font(.system(size: 30, weight: .light))
                                    Text("regular").font(.system(size: 30, weight: .regular))
                                    Text("medium").font(.system(size: 30, weight: .medium))
                                    Text("semibold").font(.system(size: 30, weight: .semibold))
                                    Text("bold").font(.system(size: 30, weight: .bold))
                                    Text("heavy").font(.system(size: 30, weight: .heavy))
                                    Text("black").font(.system(size: 30, weight: .black))
                                }
                            } else if index == 1 {
                                
                                VStack(){
                                    Text("default").font(.system(size: 30, design: .default))
                                    Text("rounded").font(.system(size: 30, design: .rounded))
                                    Text("serif").font(.system(size: 30, design: .serif))
                                    Text("monospaced").font(.system(size: 30, design: .monospaced))
                                    
                                    
                                    
                                }
                            } else if index == 2 {
                                
                                VStack(){
                                    Text("default").font(.system(size: 30, design: .default))
                                    Text("rounded").font(.system(size: 30, design: .rounded))
                                    Text("serif").font(.system(size: 30, design: .serif))
                                    Text("monospaced").font(.system(size: 30, design: .monospaced))
                                    
                                }
                                
                            } else if index == 3 {
                                
                                HStack(){
                                    
                                    VStack(){
                                        Text("underline").underline()
                                        Text("red").underline(color: .red)
                                        Text("solid").underline(pattern: .solid)
                                        Text("dot").underline(pattern: .dot)
                                        Text("dash").underline(pattern: .dash)
                                        Text("dashDot").underline(pattern: .dashDot)
                                        Text("dashDotDot").underline(pattern: .dashDotDot)
                                    }
                                    
                                    VStack(){
                                        Text("strikethrough").strikethrough()
                                        Text("red").strikethrough(color: .red)
                                        Text("solid").strikethrough(pattern: .solid)
                                        Text("dot").strikethrough(pattern: .dot)
                                        Text("dash").strikethrough(pattern: .dash)
                                        Text("dashDot").strikethrough(pattern: .dashDot)
                                        Text("dashDotDot").strikethrough(pattern: .dashDotDot)
                                    }
                                    
                                }
                                
                            } else if index == 4 {
                                
                                VStack(){
                                    Text("black").foregroundStyle(.black)
                                    Text("blue").foregroundStyle(.blue)
                                    Text("brown").foregroundStyle(.brown)
                                    Text("cyan").foregroundStyle(.cyan)
                                    Text("gray").foregroundStyle(.gray)
                                    Text("green").foregroundStyle(.green)
                                    Text("indigo").foregroundStyle(.indigo)
                                    Text("mint").foregroundStyle(.mint)
                                    Text("orange").foregroundStyle(.orange)
                                    Text("pink").foregroundStyle(.pink)
                                    Text("purple").foregroundStyle(.purple)
                                    Text("red").foregroundStyle(.red)
                                    Text("teal").foregroundStyle(.teal)
                                    Text("white").foregroundStyle(.white)
                                        .background(.black)
                                    Text("clear").foregroundStyle(.clear)
                                        .background(.black)
                                }
                                
                            } else if index == 5 {
                                
                                VStack(){
                                    Text("linearGradient")
                                        .font(.system(size: 30)) // Set the font size to 30
                                        .foregroundStyle(.linearGradient(
                                            colors: [lightBlue, deepSeaBlue, sandyBeige, coralPink],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        ))
                                    Text("AngularGradient")
                                        .font(.system(size: 30))
                                        .foregroundStyle(AngularGradient(
                                            colors: [mossGreen, pineGreen, earthBrown, skyBlue],
                                            center: .center
                                        ))
                                    Text("conicGradient")
                                        .font(.system(size: 30))
                                        .foregroundStyle(.conicGradient(
                                            colors: [sunsetOrange, twilightPurple, duskBlue, nightBlack],
                                            center: .center
                                        ))
                                    Text("ellipticalGradient")
                                        .font(.system(size: 30))
                                        .foregroundStyle(.ellipticalGradient(
                                            colors: [babyPink, softYellow, lightLavender, paleBlue]
                                        ))
                                    Text("RadialGradient")
                                        .font(.system(size: 30))
                                        .foregroundStyle(RadialGradient(
                                            colors: [graphiteGray, steelBlue, brickRed, creamWhite],
                                            center: .center,
                                            startRadius: 30,
                                            endRadius: 100
                                        ))
                                    
                                }
                                
                            } else if index == 6 {
                                
                                VStack(){
                                    Text("background color").background(twilightPurple)
                                    Text("background gradient").background(.linearGradient(
                                        colors: [lightLavender, skyBlue],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    ))
                                    Text("background color with\npadding")
                                        .background(sunsetOrange)
                                        .padding(10)
                                    
                                    (Text("Mixing it ").font(.title) +
                                     Text("and then Up!!!").font(.custom("Snell Roundhand", size: 24)))
                                           .background(babyPink)
                                           .foregroundColor(creamWhite)
                                           .baselineOffset(10)
                                           .kerning(2)
                                           .tracking(1)
                                           .strikethrough(true, color: softYellow)
                                           .underline(true, color: earthBrown)
                                           .padding()
                                   }
                                
                                
                                
                                
                            } else if index == 7 {
                                
                                VStack(){
                                    Text("largeTitle").font(.largeTitle)
                                    Text("title").font(.title)
                                    Text("title2").font(.title2)
                                    Text("title3").font(.title3)
                                    Text("headline").font(.headline)
                                    Text("body").font(.body)
                                    Text("callout").font(.callout)
                                    Text("subheadline").font(.subheadline)
                                    Text("footnote").font(.footnote)
                                    Text("caption").font(.caption)
                                    Text("caption2").font(.caption2)
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        if self.expandedViewIndex == index {
                            self.expandedViewIndex = nil // Collapse
                        } else {
                            self.expandedViewIndex = index // Expand
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TypographyView()
}

struct ChildView<Header: View, Content: View>: View {
    let index: Int
    var isExpanded: Bool
    let header: Header
    let content: Content
    
    init(index: Int, isExpanded: Bool, @ViewBuilder header: () -> Header, @ViewBuilder content: () -> Content) {
        self.index = index
        self.isExpanded = isExpanded
        self.header = header()
        self.content = content()
    }
    
    var body: some View {
        VStack {
            header // Display custom header here
            
            if isExpanded {
                
                content // Display custom content here
                    .padding(.top, 20)
            }
        }
        .frame(width: widthInnerText)
        .padding()
        .background(isExpanded ? Color.white : steelBlue)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: isExpanded ? 1 : 0)
        )
        .animation(.easeInOut, value: isExpanded)
    }
}
