//
//  weatherManager.swift
//  Tempo
//
//  Created by Mizanur Remon on 28/12/19.
//  Copyright © 2019 Mizanur Remon. All rights reserved.
//

import Foundation

struct weatherManager {
    let URL = "http://api.openweathermap.org/data/2.5/weather?appid=7013acc9bca4f12a02f7fe47b7646e5c&units=metric"
    
    
    func fetchWeather(cityName: String){
        let URLstring = URL + "&q=" + cityName
        
        print(URLstring)
    }
}
