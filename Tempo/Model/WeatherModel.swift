//
//  WeatherModel.swift
//  Tempo
//
//  Created by Mizanur Remon on 9/1/20.
//  Copyright © 2020 Mizanur Remon. All rights reserved.
//

import Foundation


struct WeatherModel{
    let realID: Int
    let locName: String
    let realTemp: double_t
    
    var temperatureDecimalControl: String{
        return String(format: "%.1f", realTemp)
    }
    
    var conditionName: String{
        switch realID{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
