//
//  CurrentWeather.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 18/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather{
    var _cityname : String!
    var _date : String!
    var _weatherType : String!
    var _currentTemp : Double!
    
    var cityName : String{
        if _cityname == nil{
            _cityname = ""
        }
        
        return _cityname
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
    
    var currentTemp : Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetails( completed : @escaping DownloadComplete){
        let currentWeather = URL(string: CURRENT_WEATHER_URL)!
        print(currentWeather)
        Alamofire.request(currentWeather).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String {
                    self._cityname = name.capitalized
                    print(self._cityname!)
                }
                
                if let weatherType = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let weather = weatherType[0]["main"] as? String{
                        self._weatherType = weather.capitalized
                         print(self._weatherType!)
                    }
                }
                
                if let currentTemp = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = currentTemp["temp"] as? Double{
                        self._currentTemp = temp
                        print(self._currentTemp!)
                    }
                }
            }
        
             completed()
        }
    }
}

