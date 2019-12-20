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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.delegate = self
        
    }
    @IBAction func searchButton(_ sender: Any) {
        search.endEditing(true)
        let text = search.text!
        print(text)
        place.text = text
    }
    
    @IBAction func exitButton(_ sender: Any) {
        let alert = UIAlertController(title: "Quit", message: "Are you sure?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yse", style: .destructive, handler: { _ in
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)}))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search.endEditing(true)
        place.text = search.text!
        return true
    }
    
    

}

