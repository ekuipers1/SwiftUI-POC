//
//  LangRecognizerView.swift
//  Tester
//
//  Created by Erik Kuipers on 17.11.23.
//

import SwiftUI
import NaturalLanguage

struct LangRecognizerView: View {
    
    @State private var text = ""
    @State private var currentLangLegend = ""
    @State private var currentLang = ""

    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            TextField("Write here", text: $text)
                .font(.system(size: 50))
                .bold()
            Spacer()
            VStack {
                Text(currentLangLegend)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                if currentLangLegend == "Unrecognized language" {
                    EmptyView()
                } else {
                    Text(currentLang)
                        .font(.system(size: 46, weight: .bold))
                        .multilineTextAlignment(.center)
                        .overlay {
                            LinearGradient(
                                colors: [.red, .blue],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(
                                Text(currentLang)
                                    .font(Font.system(size: 46, weight: .bold))
                                    .multilineTextAlignment(.center)
                            )
                        }
                }
            }
            .bold()
            .foregroundColor(.blue)
            .fontDesign(.rounded)
            Spacer()
            Button("Detect the language") {
                recognizeTextLang()
            }
            .buttonStyle(.borderedProminent).font(.title)
        }.padding(25)
    }
    
    func recognizeTextLang()  {
        
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        
        if let language = recognizer.dominantLanguage {
            let langString = language.rawValue
            switch langString {
            case "en":
                currentLangLegend = "Your text is written in"
                currentLang = "english"
            case "es":
                currentLangLegend = "Tu texto está escrito en"
                currentLang = "español"
            case "nl":
                currentLangLegend = "Uw tekst is geschreven in"
                currentLang = "nederlands"
            case "it":
                currentLangLegend = "Il tuo testo è scritto"
                currentLang = "italiano"
            default:
                currentLangLegend = "Unrecognized language"
            }
            
        } else {
            print("Language not recognized")
        }
    }
}

#Preview {
    LangRecognizerView()
}
