//
//  MapView.swift
//  Tester
//
//  Created by Erik Kuipers on 01.12.23.
//

import SwiftUI
import MapKit
import UIKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var showingSheet = false
    @State private var selectedCircuit: Circuit? = nil
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.circuits) { circuit in
            MapAnnotation(coordinate: circuit.coordinate) {
                Button(action: {
                    print("Button tapped, circuit selected: \(circuit.name)")
                    self.selectedCircuit = circuit
                    self.showingSheet = true
                }) {
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(sunsetOrange)
                }
            }
        }
        .onAppear {
            viewModel.fetchCircuits {
            }
        }
        .sheet(isPresented: $showingSheet) {
            let _ = print("Presenting sheet for circuit: \(selectedCircuit?.name ?? "None")")
            if let selectedCircuit = selectedCircuit {
                CircuitDetailView(circuit: selectedCircuit)
            }
        }
    }
}

struct CircuitDetailView: View {
    var circuit: Circuit
    
    var body: some View {
        VStack {
            Text(circuit.name)
                .font(.headline)
            
            let trackName = circuit.locality + "Track"
            Image(trackName)
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

class MapViewModel: ObservableObject {
    @Published var circuits = [Circuit]()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), // Default region
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    )
    
    func fetchCircuits(completion: @escaping () -> Void) {
        guard let url = URL(string: "http://ergast.com/api/f1/2023/circuits.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            let decoder = JSONDecoder()
            if let circuitResponse = try? decoder.decode(CircuitResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.circuits = circuitResponse.MRData.CircuitTable.Circuits.map {
                        Circuit(
                            id: $0.circuitId,
                            name: $0.circuitName,
                            coordinate: CLLocationCoordinate2D(
                                latitude: Double($0.Location.lat) ?? 0,
                                longitude: Double($0.Location.long) ?? 0
                            ),
                            locality: $0.Location.locality
                        )
                    }
                    completion()
                }
            }
        }.resume()
    }
}

#Preview {
    MapView()
}


struct CircuitResponse: Codable {
    var MRData: MRData
}

struct MRData: Codable {
    var CircuitTable: CircuitTable
}

struct CircuitTable: Codable {
    var Circuits: [CircuitData]
}

struct CircuitData: Codable {
    var circuitId: String
    var circuitName: String
    var Location: CircuitLocation
}

struct CircuitLocation: Codable {
    var lat: String
    var long: String
    var locality: String
}

struct Circuit: Identifiable {
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D
    let locality: String
}

class SelectedAnnotationDetails: ObservableObject {
    @Published var selectedCircuit: Circuit?
}
