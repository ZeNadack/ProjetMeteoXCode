//
//  ContentView.swift
//  ProjetMeteoXCode
//
//  Created by Theo Blanchard on 10/18/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text("Projet Météo")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                
                TextField("Entrez le nom d'une ville", text: $viewModel.cityName)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .shadow(radius: 10)
                
                Button(action: {
                    viewModel.fetchWeather()
                }) {
                    Text("Obtenir la météo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding(.horizontal, 40)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    VStack(spacing: 20) {
                        
                        if !viewModel.description.isEmpty {
                            Image(systemName: iconForWeather(description: viewModel.description))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.yellow)
                            
                            Text("Ville : \(viewModel.cityName)")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            
                            Text("Température : \(viewModel.temperature)")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Humidité : \(viewModel.humidity)")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            Text("Description : \(viewModel.description)")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func iconForWeather(description: String) -> String {
        switch description.lowercased() {
        case "ciel dégagé":
            return "sun.max.fill"
        case "couvert", "nuageux", "partiellement nuageux":
            return "cloud.fill"
        case "légère pluie", "pluie", "bruine légère", "pluie modérée":
            return "cloud.rain.fill"
        case "orage":
            return "cloud.bolt.fill"
        case "légères chutes de neige", "chutes de neige":
            return "cloud.snow.fill"
        case "mist":
            return "cloud.fog.fill"
        default:
            return "cloud.fill"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
