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
        let url = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=2021-12-16"
        getData(from: url)
    }
    private func getData(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch{
                print(error)
            }
            
            guard let json = result else {
                return
            }
            
            print(json.status)
            print(json.results.sunrise)
            print(json.results.sunset)
            print(json.results.day_lenght)
            
            
        })
        
        task.resume()
        
    }
}

    struct Response: Codable {
        let results: MyResult
        let status: String
    }
    
    struct MyResult: Codable {
        let sunrise: String
        let sunset: String
        let solar_noon: String
        let day_lenght: Int
        let civil_twilight_begin: String
        let civil_twilight_end: String
        let nautical_twilight_begin: String
        let nautical_twilight_end: String
        let astronomical_twilight_begin: String
        let astronomical_twilight_end: String
        
    }


/*
 {
       "results":
       {
         "sunrise":"2015-05-21T05:05:35+00:00",
         "sunset":"2015-05-21T19:22:59+00:00",
         "solar_noon":"2015-05-21T12:14:17+00:00",
         "day_length":51444,
         "civil_twilight_begin":"2015-05-21T04:36:17+00:00",
         "civil_twilight_end":"2015-05-21T19:52:17+00:00",
         "nautical_twilight_begin":"2015-05-21T04:00:13+00:00",
         "nautical_twilight_end":"2015-05-21T20:28:21+00:00",
         "astronomical_twilight_begin":"2015-05-21T03:20:49+00:00",
         "astronomical_twilight_end":"2015-05-21T21:07:45+00:00"
       },
        "status":"OK"
     }
 */
