//
//  CurrentWeather.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 18/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import Foundation
import Alamofire

class ForecastWeather{
    
    var _date : String!
    var _weatherType : String!
    var _highTemp : Double!
    var _lowTemp : Double!
    
    var forecastWeather = [ForecastWeather]()
    
    var highTemp : Double{
        if _highTemp == nil{
            _highTemp = 0.0
        }
        
        return _highTemp
    }
    
    var date : String{
        if _date == nil{
            _date = ""
        }
        let currentDate = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.long, timeStyle: DateFormatter.Style.none)
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType : String{
        if _weatherType == nil{
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var lowTemp : Double{
        if _lowTemp == nil{
            _lowTemp = 0.0
        }
        
        return _lowTemp
    }
    
    init() {
    }
    
    init(date : String, weatherType : String, lowTemp : Double, highTemp : Double) {
        self._date = date
        self._weatherType = weatherType
        self._lowTemp = lowTemp
        self._highTemp = highTemp
    }
    
    func downloadForecastDetails( completed : @escaping DownloadComplete) {
        let currentWeather = URL(string: FORECAST_WEATHER_URL)!
        
        Alamofire.request(currentWeather).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let tempList = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for tem in 0...tempList.count-1 {
                        
                        if let temp = tempList[tem]["temp"] as? Dictionary<String, AnyObject>{
                            if let lowTemp = temp["min"] as? Double{
                                self._lowTemp = lowTemp
                            }
                            if let highTemp = temp["max"] as? Double{
                                self._highTemp = highTemp
                            }
                        }
                        
                        if let weatherDictionaryList = tempList[tem]["weather"] as? [Dictionary<String, AnyObject>]{
                            for weatherDictionary in 0...weatherDictionaryList.count-1 {
                                if let weather = weatherDictionaryList[weatherDictionary]["main"] as? String{
                                    self._weatherType = weather
                                }
                            }
                        }
                        
                        if let date = tempList[tem]["dt"] as? String{
                            self._date = date
                        }
                        
                        self.forecastWeather.append(ForecastWeather(date: self.date, weatherType: self.weatherType, lowTemp: self.lowTemp, highTemp: self.highTemp))
                        
                    }
                
                }
                
            }
            
             completed()
        }
        
    }
}

