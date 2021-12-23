//
//  ViewController.swift
//  API Request Tutorial
//
//  Created by Damla Çim on 21.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let url = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=2021-12-16"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData(from: url)
    }
    private func getData(from url: String) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                
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
            print(json.results.dayLength)
            
        })
        
        task.resume()
            
        }
    }

struct Response: Decodable {
    let results: Results
    let status: String
}


struct Results: Decodable {
    let sunrise, sunset, solarNoon, dayLength: String
    let civilTwilightBegin, civilTwilightEnd, nauticalTwilightBegin, nauticalTwilightEnd: String
    let astronomicalTwilightBegin, astronomicalTwilightEnd: String

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset
        case solarNoon = "solar_noon"
        case dayLength = "day_length"
        case civilTwilightBegin = "civil_twilight_begin"
        case civilTwilightEnd = "civil_twilight_end"
        case nauticalTwilightBegin = "nautical_twilight_begin"
        case nauticalTwilightEnd = "nautical_twilight_end"
        case astronomicalTwilightBegin = "astronomical_twilight_begin"
        case astronomicalTwilightEnd = "astronomical_twilight_end"
    }
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
