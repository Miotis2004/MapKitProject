//
//  Location.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import Foundation

struct Location: Codable, Hashable, Identifiable {
    
    var city: String
    //var city_ascii: String
    var state_id: String
    //var state_name: String
    //var county_fips: Int
    //var county_name: String
    var lat: Double
    var lng: Double
    //var population: Int
    //var density: Int
    //var source: String
    //var military: String
    //var incorporated: String
    //var timezone: String
    //var ranking: Int
    //var zips: String
    var id: Int
    
}
