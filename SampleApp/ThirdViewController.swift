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

        print(CURRENT_WEATHER_URL)
        tableView.delegate = self
        tableView.dataSource = self
        print(("Data : \(dataComing)"))
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails(){
           self.updateUI()
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for : indexPath)
        
        return cell
    }
    
    func updateUI(){
        print(" okh \(currentWeather.cityName)")
        currentDate.text = currentWeather.date
        currentTemp.text = "\(currentWeather.currentTemp)"
        currentCity.text = currentWeather.cityName
        currentWeatherType.text = currentWeather.weatherType
    }
    
    
}
