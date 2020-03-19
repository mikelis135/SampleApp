//
//  ThirdViewController.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 17/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import UIKit
import Alamofire

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    private var dataComing: String = ""
    
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentCity: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentWeatherType: UILabel!
    
    var currentWeather = CurrentWeather()
    var forecastWeather = ForecastWeather()
    var forecastWeatherList = [ForecastWeather]()
    
    var getDataComing : String {
        get{
            return dataComing
        }
        set{
            dataComing = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        print(("Data : \(dataComing)"))
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails(){
           self.updateWeatherUI()
        }
        
       self.forecastWeather.downloadForecastDetails {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecastWeather.forecastWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for : indexPath) as? WeatherTableViewCell{
            let forecast = self.forecastWeather.forecastWeather[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
       }
       else{
         return WeatherTableViewCell()
        }
    }
    
    func updateWeatherUI(){
        currentDate.text = currentWeather.date
        currentTemp.text = "\(currentWeather.currentTemp)"
        currentCity.text = currentWeather.cityName
        currentWeatherType.text = currentWeather.weatherType
    }
    
}
