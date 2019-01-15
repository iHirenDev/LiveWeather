//
//  APIClient.swift
//  LiveWeather
//
//  Created by Hiren Patel on 11/1/19.
//  Copyright © 2019 com.hiren. All rights reserved.
//

import Foundation

class APIClient: NSObject {
    
    
    
    func apiCall(completion: @escaping ([NSDictionary]?) -> Void){
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/group?id=4163971,2147714,2174003&units=metric&APPID=ef1b799fc53a0271bb79ab9611f79b69") else {
            print("Error unwrapping URL"); return }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let unwrappedData = data else { return }
            do {
                if let data = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSDictionary{
                    if let weatherData = data.value(forKeyPath: "list") as? [NSDictionary]{
                        completion(weatherData)
                    }
                }
                
            } catch {
                completion(nil)
                print("json error: \(error)")
            }
        }
        task.resume()
    }
}
