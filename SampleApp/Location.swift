//
//  Location.swift
//  SampleApp
//
//  Created by Taiwo Adebayo on 19/03/2020.
//  Copyright © 2020 Taiwo Adebayo. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var LONGITUDE : Double!
    var LATITUDE : Double!
}
