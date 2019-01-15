//
//  WeatherModel.swift
//  LiveWeather
//
//  Created by Hiren Patel on 11/1/19.
//  Copyright © 2019 com.hiren. All rights reserved.
//

import Foundation

struct WeatherModel {
    var coord : Coord?
    var weather : [Weather]?
    var base : String?
    var main : Main?
    var visibility : Int?
    var wind : Wind?
    var clouds : Clouds?
    var dt : Int?
    var sys : Sys?
    var id : Int?
    var name : String?
    var cod : Int?
    
    init(dictionary:NSDictionary) {
        if (dictionary["coord"] != nil) {
            coord = Coord(dictionary: dictionary["coord"] as! NSDictionary)
        }
        
        if (dictionary["weather"] != nil) {
            weather = Weather.modelsFromDictionary(array: dictionary["weather"] as! NSArray)
        }
        base = dictionary["base"] as? String
        if (dictionary["main"] != nil) { main = Main(dictionary: dictionary["main"] as! NSDictionary) }
        visibility = dictionary["visibility"] as? Int
        if (dictionary["wind"] != nil) { wind = Wind(dictionary: dictionary["wind"] as! NSDictionary) }
        if (dictionary["clouds"] != nil) { clouds = Clouds(dictionary: dictionary["clouds"] as! NSDictionary) }
        dt = dictionary["dt"] as? Int
        if (dictionary["sys"] != nil) { sys = Sys(dictionary: dictionary["sys"] as! NSDictionary) }
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        cod = dictionary["cod"] as? Int
    }
}

struct Coord {
    var lon:Double?
    var lat:Double?
    
    init(dictionary: NSDictionary) {
        lon = dictionary["lon"] as? Double
        lat = dictionary["lat"] as? Double
    }
}

struct Sys {
    var type:Int?
    var id:Int?
    var message:Double?
    var country:String?
    var sunrise:Int?
    var sunset:Int?
    
    init(dictionary:NSDictionary) {
        type = dictionary["type"] as? Int
        id = dictionary["id"] as? Int
        message = dictionary["message"] as? Double
        country = dictionary["country"] as? String
        sunrise = dictionary["sunrise"] as? Int
        sunset = dictionary["sunset"] as? Int
    }
}

struct Main {
    var temp:Double?
    var pressure:Int?
    var humidity:Int?
    var temp_min:Double?
    var temp_max:Double?
    
    init(dictionary:NSDictionary) {
        temp = dictionary["temp"] as? Double
        pressure = dictionary["pressure"] as? Int
        humidity = dictionary["humidity"] as? Int
        temp_min = dictionary["temp_min"] as? Double
        temp_max = dictionary["temp_max"] as? Double
    }
}

struct Wind {
    var speed:Double?
    var deg:Int?
    
    init(dictionary:NSDictionary) {
        speed = dictionary["speed"] as? Double
        deg = dictionary["deg"] as? Int
    }
}

struct Clouds {
    var all:Int?
    
    init(dictionary:NSDictionary) {
        all = dictionary["all"] as? Int
    }
}

public class Weather {
    var id:Int?
    var main:String?
    var description:String?
    var icon:String?
    
   class func modelsFromDictionary(array:NSArray) -> [Weather] {
        var models:[Weather] = []
        for item in array
        {
            models.append(Weather(dictionary: item as! NSDictionary))
        }
        return models
    }
    
    init(dictionary:NSDictionary) {
        id = dictionary["id"] as? Int
        main = dictionary["main"] as? String
        description = dictionary["description"] as? String
        icon = dictionary["icon"] as? String
    }
}
