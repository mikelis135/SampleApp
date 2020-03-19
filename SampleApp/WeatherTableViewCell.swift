//
//  WeatherTableViewCell.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 19/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    func configureCell(forecast : ForecastWeather){
        weatherTypeLabel.text = forecast.weatherType
        highTempLabel.text = "\(forecast.highTemp)"
        lowTempLabel.text = "\(forecast.lowTemp)"
    }
}
