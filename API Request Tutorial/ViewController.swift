//
//  ViewController.swift
//  API Request Tutorial
//
//  Created by Damla Çim on 21.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let url = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=2021-12-16"
    
    struct Response: Codable {
        let results: MyResult
        let status: String
    }
    
    struct MyResult: Codable {
        
    }


}

