//
//  Location.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import Foundation

struct Location: Hashable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var latitude: Double
    var longitude: Double
}
