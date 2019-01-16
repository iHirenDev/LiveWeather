//
//  WeatherViewModel.swift
//  LiveWeather
//
//  Created by Hiren Patel on 13/1/19.
//  Copyright © 2019 com.hiren. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewModel: NSObject {
    typealias CompletionHandler = (_ success:Bool) -> Void
    
    var apiClient = APIClient()
    var weatherData:[NSDictionary] = []
    var weather:[WeatherModel] = []
    

    override init() {
        super.init()
    }
    
    func fetchWeatherInfo(completion:@escaping CompletionHandler) {
        apiClient.apiCall { (weatherDict) in
            self.weatherData = weatherDict! as [NSDictionary]
            self.weather = self.weatherArray(array: self.weatherData)
            print(self.weather[1].main?.temp)
            let arr = self.weather[1].weather
            print(arr?[0].description)
            completion(true)
        }
    }
    
    func weatherArray(array:[NSDictionary]) -> [WeatherModel] {
        for info in array{
            weather.append(WeatherModel.init(dictionary: info))
        }
        return weather
    }
    
    func numberOfRows() -> Int {
        return weather.count
    }
}
