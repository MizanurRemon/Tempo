//
//  weatherManager.swift
//  Tempo
//
//  Created by Mizanur Remon on 28/12/19.
//  Copyright © 2019 Mizanur Remon. All rights reserved.
//

import Foundation

class weatherManager {
    
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
            let task = session.dataTask(with: url) { (data, response, error) in
                 if error != nil{
                           return
                       }
                       
                       else if let safeData = data{
                           
                            self.parseJSOn(weatherData: safeData)
                    
                       }
            }
            
            task.resume()
            
            
        }
    }
    
    func parseJSOn(weatherData: Data){
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let location = decodedData.name
            let temperature = decodedData.main.temp
            let conditionID = decodedData.weather[0].id
            
            
            print("Location: ", location)
            print("Temperature: ", temperature)
            print("ID: ", conditionID)
            
            
             let weather = WeatherModel(realID: conditionID, locName: location, realTemp: temperature)
            
            print(weather.conditionName)
            
            
            
        }catch{
            print(error)
        }
    }
    
   
   
}
