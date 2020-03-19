//
//  Constants.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 18/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat=\(Location.sharedInstance.LATITUDE!)"
let LONGITUDE = "&lon=\(Location.sharedInstance.LONGITUDE!)"
let APPID = "&appid="
let API_KEY = "f3b8a53100a71e1ad749904649407b18"

typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APPID)\(API_KEY)"
let FORECAST_WEATHER_URL = "https://samples.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.LATITUDE!)&lon=\(Location.sharedInstance.LONGITUDE!)&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"

