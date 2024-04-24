//
//  Constant.swift
//  PlacesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
struct Constant{
    static let apiKey = "Type your api key"
    static let prompt = """
    give me inspiration for activities that can be done during the day inthe city of Palembang. Provide the response as an array of JSON as
    [
        {
            "place": "name"
            "activity": "activities"
            "price": "5.000"
 
        }
    ]
    only. Remove any backticks.
 """
}
