//
//  WeatherViewModel.swift
//  ProjetMeteoXCode
//
//  Created by Theo Blanchard on 10/18/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var temperature: String = ""
    @Published var humidity: String = ""
    @Published var description: String = ""
    @Published var errorMessage: String = ""
    
    private var weatherService = WeatherService()
    
    func fetchWeather() {
        guard !cityName.isEmpty else {
            self.errorMessage = "Le nom de la ville ne peut pas être vide."
            return
        }
        
        weatherService.fetchWeather(for: cityName) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherResponse):
                    self.temperature = "\(weatherResponse.main.temp)°C"
                    self.humidity = "\(weatherResponse.main.humidity)%"
                    self.description = weatherResponse.weather.first?.description.capitalized ?? ""
                    self.errorMessage = ""
                case .failure(let error):
                    self.errorMessage = "Erreur : \(error.localizedDescription)"
                }
            }
        }
    }
}
