//
//  File.swift
//  Tempo
//
//  Created by Mizanur Remon on 29/12/19.
//  Copyright © 2019 Mizanur Remon. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    //let weather: Weather?
    
}

struct Main: Decodable{
    let temp: Double
}

/*struct Weather: Decodable{
    let description: String
}

*/
