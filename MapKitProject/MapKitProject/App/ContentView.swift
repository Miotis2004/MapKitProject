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
    @State private var originCity: Location = Location(city: "Cottage Grove", state_id: "OR", lat: 45.0, lng: 122.3,  id: 0)
    
    @State private var citySelected = false
    @State private var originSelected = false
    
    @State private var originSearch = "Cottage Grove"
    @State private var destSearch = "Cottage Grove"
    
    var body: some View {
        
        if !originSelected {
            let sortedCities = cityList.sorted(by: { $0.city < $1.city })
            VStack {
                Text("Select Origin")
//                HStack{
//                    TextField("Origin City", text: $originSearch)
//                    Button(action: {
//                        ForEach(sortedCities) { city in
//                            if originSearch.lowercased() == city.city.lowercased() {
//                                originCity = Location(city: city.city,  state_id: city.state_id,  lat: city.lat, lng: city.lng, id: city.id)
//                                originSelected.toggle()
//                            }
//                        }
//                    }, label: {
//                        Image(systemName: "magnifyingglass")
//                    })
//                 }
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 40) {
                        
                        ForEach(sortedCities) { city in
                            Button(action: {
                                originCity = Location(city: city.city,  state_id: city.state_id,  lat: city.lat, lng: city.lng, id: city.id)
                                originSelected.toggle()
                            }, label: {
                                Text("\(city.city), \(city.state_id)")
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            })
                        }
                    }
                }
            }
        } else {
        
            if !citySelected {
                let sortedCities = cityList.sorted(by: { $0.city < $1.city })
                VStack {
                    Text("Select Destination")
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 40) {
                            
                            ForEach(sortedCities) { city in
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
                }
            } else {
                ShowRoute(destCity: $destCity, originCity: $originCity, citySelected: $citySelected, originSelected: $originSelected)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


