//
//  WeatherService.swift
//  ProjetMeteoXCode
//
//  Created by Theo Blanchard on 10/18/24.
//

import Foundation

class WeatherService {
    private let apiKey = "16c5ca662b13a22d3897b198031492a9"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        guard let urlString = "\(baseUrl)?q=\(city)&appid=\(apiKey)&units=metric&lang=fr"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
