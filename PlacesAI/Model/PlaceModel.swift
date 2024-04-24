//
//  PlaceModel.swift
//  PlacesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
struct PlaceModel : Codable, Hashable{
    var place: String
    var activity: String
    var price: String
}

extension PlaceModel{
    static let dummyData: [PlaceModel] = [
    PlaceModel(
        place: "Baso Damas",
        activity: "Eat Meat Ball",
        price: "35.000")
    ]
}
