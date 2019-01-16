//
//  WeatherDetailVC.swift
//  LiveWeather
//
//  Created by Hiren Patel on 16/1/19.
//  Copyright © 2019 com.hiren. All rights reserved.
//

import UIKit

class WeatherDetailVC: UIViewController {
    
    var weatherDetailDict: [String: Any] = [:]

    @IBOutlet weak var lblMinTemp:UILabel!
    @IBOutlet weak var lblMaxTemp:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var lblHumidity:UILabel!
    @IBOutlet weak var lblWind:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = (weatherDetailDict["city"] as! String)
        
       // let minTemp = weatherDetailDict["minTemp"]
        
        if let minTemp = weatherDetailDict["minTemp"] as? Double {
            lblMinTemp.text = String("Minimum Temparature: \(minTemp)")
        }
        if let maxTemp = weatherDetailDict["maxTemp"] as? Double {
            lblMaxTemp.text = String("Maximum Temparature: \(maxTemp)")
        }
        
        let desc = weatherDetailDict["description"] as? String
        
        lblDescription.text = "Description:\(desc ?? "")"
        
        if let humidity = weatherDetailDict["humidity"] as? Int {
            lblHumidity.text = String("Humidity: \(humidity)")
        }
        if let wind = weatherDetailDict["wind"] as? Double {
            lblWind.text = String("Wind: \(wind) km/hr")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
