//
//  ViewController.swift
//  Tempo
//
//  Created by Mizanur Remon on 20/12/19.
//  Copyright © 2019 Mizanur Remon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var place: UILabel!
    
    var manageweather = weatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.delegate = self
        
    }
    @IBAction func searchButton(_ sender: Any) {
        if search.text == ""{
            place.text = nil
            popupalert()
        }
        else{
            place.text = search.text!
        }
        search.endEditing(true)
        
        if let city = place.text{
            manageweather.fetchWeather(cityName: city)
        }
        
        
    }
    
    @IBAction func exitButton(_ sender: Any) {
        let alert = UIAlertController(title: "Quit", message: "Are you sure?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yse", style: .destructive, handler: { _ in
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)}))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if search.text == ""{
            place.text = nil
            popupalert()
        }
        else{
            place.text = search.text!
        }
        search.endEditing(true)
        
        if let city = place.text{
            manageweather.fetchWeather(cityName: city)
        }
        
        return true
    }
    
    
   func textFieldDidEndEditing(_ textField: UITextField) {
        search.text = ""
    }
    
    
    func popupalert(){
        let popalert = UIAlertController(title: "Error", message: "Place Missing", preferredStyle: UIAlertController.Style.alert)
                  
            popalert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
         present(popalert, animated: true, completion: nil)
    }
}

