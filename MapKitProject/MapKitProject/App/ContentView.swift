//
//  ContentView.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    
    var cityList: [Location] = Bundle.main.decode("cities.json")

    @State private var destCity: Location = Location(city: "Cottage Grove", state_id: "OR", lat: 45.0, lng: 122.3,  id: 0)
    
    @State private var citySelected = false
    
    var body: some View {
        
        if !citySelected {
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 40) {
                    
                    ForEach(cityList) { city in
                        Button(action: {
                            destCity = Location(city: city.city,  state_id: city.state_id,  lat: city.lat, lng: city.lng, id: city.id)
                                                        citySelected.toggle()
                        }, label: {
                            Text("\(city.city), \(city.state_id)")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        })
                    }
                }
            }
        } else {
            ShowRoute(destCity: $destCity, citySelected: $citySelected)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


