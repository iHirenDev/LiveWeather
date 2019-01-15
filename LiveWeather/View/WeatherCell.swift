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
    }
}
