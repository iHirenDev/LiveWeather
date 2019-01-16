//
//  WeatherCell.swift
//  LiveWeather
//
//  Created by Hiren Patel on 14/1/19.
//  Copyright © 2019 com.hiren. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var lblCityName:UILabel!
    @IBOutlet weak var lblTemp:UILabel!
    @IBOutlet weak var weatherImg:UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func weatherData(weatherInfo:WeatherModel) {
        self.lblCityName.text = weatherInfo.name
        
        self.lblTemp.text = String((weatherInfo.main?.temp)!)
        
        let weatherDescription = weatherInfo.weather?[0].main
        
        if weatherDescription == "Clear"{
            self.weatherImg.image = UIImage(named: "sunny")
        }
        else if(weatherDescription == "Clouds"){
            self.weatherImg.image = UIImage(named: "cloudy")
        }else{
            self.weatherImg.image = UIImage(named: "rainy")
        }
        
        
    }
}
