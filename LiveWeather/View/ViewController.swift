//
//  ViewController.swift
//  LiveWeather
//
//  Created by Hiren Patel on 10/1/19.
//  Copyright © 2019 com.hiren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView:UITableView!
    
    var apiClient = APIClient()
    var viewModel = WeatherViewModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ef1b799fc53a0271bb79ab9611f79b69
        
   
        tblView.delegate = self
        tblView.dataSource = self
        tblView.tableFooterView = UIView()
        
        tblView.isHidden = true
        
        let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = true
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        
        
        
        view.addSubview(myActivityIndicator)
        view.bringSubviewToFront(myActivityIndicator)
        
        viewModel.fetchWeatherInfo { (success) in
            if(success){
                DispatchQueue.main.async {
                    myActivityIndicator.stopAnimating()
                    self.tblView.isHidden = false
                    self.tblView.reloadData()
                }
            }
        }
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:WeatherCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        let weatherInfo = viewModel.weather[indexPath.row]
        cell.weatherData(weatherInfo: weatherInfo)
        return cell
        
    }
}

