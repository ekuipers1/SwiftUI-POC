//
//  pocView.swift
//  Tester
//
//  Created by Erik Kuipers on 04.12.23.
//

import SwiftUI

struct pocView: View {
    @ObservedObject var viewModel = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .center, spacing: 40, pinnedViews: [.sectionHeaders]) {
                    ForEach(viewModel.countries, id: \.id) { country in
                        Section(header: HStack {
                            Text(country.flag)
                                .font(.system(size: 30))
                                .frame(width: 50)
                                .padding(.trailing, 20)
                            Text(country.name.common)
                                .font(.headline)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                            .frame(width: widthInnerText, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white))
                                .padding(.horizontal)) {
                                    
                                    ZStack(){
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .fill(Color.white)
                                            .frame(width: widthInnerText, height: 80)
                                            .shadow(color: .gray, radius: 3, y: 1)
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Capital: \(country.capital.joined())")
                                                        .font(.subheadline)
                                                    Text("Population: \(country.population)")
                                                        .font(.subheadline)
                                                }
                                            }
                                        }
                                    }.frame(width: widthInnerText)
                                        .offset(y: -30)
                                }
                    }
                }.frame(width: widthInner)
            }
            .navigationTitle("European Countries")
            .onAppear {
                self.viewModel.loadData()
            }
        }
    }
}



struct MyCell: View {
    let country: Country
    
    var body: some View {
        
        ZStack(){
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white)
                .frame(width: 120, height: 120)
                .shadow(color: .gray, radius: 3, y: 1)
                .padding(.top, 20.0)
            
            VStack {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Capital: \(country.capital.joined())")
                            .font(.subheadline)
                        Text("Population: \(country.population)")
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}



#Preview {
    pocView()
}




struct Country: Decodable, Identifiable {
    var id: String { name.common }
    var name: Name
    var capital: [String]
    var flag: String
    var population: Int
    
    struct Name: Decodable {
        var common: String
    }
}


class CountriesViewModel: ObservableObject {
    @Published var countries = [Country]()
    
    func loadData() {
        guard let url = URL(string: "https://restcountries.com/v3.1/region/europe") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Country].self, from: data) {
                    DispatchQueue.main.async {
                        self.countries = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

