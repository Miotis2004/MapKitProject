//
//  ContentView.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    
    var cityList: [Location] = Bundle.main.decode("cities.json")

    @State private var destCity: Location = Location(city: "", state_id: "", lat: 0.0, lng: 0.0,  id: 0)
    @State private var originCity: Location = Location(city: "", state_id: "", lat: 0.0, lng: 0.0,  id: 0)
    
    @State private var citySelected = false
    @State private var originSelected = false
    
    @State private var originSearch = ""
    @State private var destSearch = ""
    
    func searchCity (search: String) -> Location {
        for city in cityList {
            if search.lowercased() == city.city.lowercased() {
                return city
            }
         }
        return Location(city: "Not Found", state_id: "US", lat: 0.0, lng: 0.0,  id: 0)
    }
    
    var body: some View {
        
        if !originSelected {
            let sortedCities = cityList.sorted(by: { $0.city < $1.city })
            VStack {
                Text("Select Origin")
                Divider()
                HStack{
                    TextField("Origin City", text: $originSearch)
                    Button(action: {
                        let search = searchCity(search: originSearch)
                        
                        if search.city != "Not Found" {
                            originCity = Location(city: search.city, state_id: search.state_id, lat: search.lat, lng: search.lng, id: search.id)
                            originSelected.toggle()
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 30))
                    })
                 }
                Divider()
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
                    Divider()
                    HStack{
                        TextField("Destination City", text: $destSearch)
                        Button(action: {
                            let search = searchCity(search: destSearch)
                            
                            if search.city != "Not Found" {
                                destCity = Location(city: search.city, state_id: search.state_id, lat: search.lat, lng: search.lng, id: search.id)
                                citySelected.toggle()
                            }
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 30))
                        })
                     }
                    Divider()
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


