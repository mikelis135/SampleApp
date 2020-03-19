//
//  Constants.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 18/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat=35"
let LONGITUDE = "&lon=25"
let APPID = "&appid="
let API_KEY = "f3b8a53100a71e1ad749904649407b18"

typealias DownloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APPID)\(API_KEY)"
let FORECAST_WEATHER_URL = "https://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"

