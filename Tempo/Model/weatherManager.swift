//
//  weatherManager.swift
//  Tempo
//
//  Created by Mizanur Remon on 28/12/19.
//  Copyright © 2019 Mizanur Remon. All rights reserved.
//

import Foundation

struct weatherManager {
    let adress = "https://api.openweathermap.org/data/2.5/weather?appid=7013acc9bca4f12a02f7fe47b7646e5c&units=metric"
    
    
    func fetchWeather(cityName: String){
        let URLstring = adress + "&q=" + cityName
        
        request(urlstring: URLstring)
    }
    
    func request(urlstring: String){
            //create URl
        if let url = URL(string: urlstring){
            
            //create url session
            let session = URLSession(configuration: .default)
            
            //create url session task
            let task = session.dataTask(with: url, completionHandler: handle(data: response:  error: ) )
            
            task.resume()
            
            
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        
        if error != nil{
            return
        }
        
        else if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
                
            print(dataString!)
        }
        
    }
}
