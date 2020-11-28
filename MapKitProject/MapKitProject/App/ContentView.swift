//
//  ContentView.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    
    let cityList: [Location] = [Cities().boston, Cities().chicago, Cities().cottageGrove, Cities().losAngeles, Cities().newYork, Cities().newOrleans, Cities().sanFrancisco, Cities().seattle, Cities().philadelphia, Cities().houston, Cities().dallas, Cities().denver, Cities().detroit, Cities().pheonix, Cities().washingtonDC]

    
    @State private var destCity: Location = Location(id: Cities().boston.id, name: Cities().boston.name, latitude: Cities().boston.latitude, longitude: Cities().boston.longitude)
    
    @State private var citySelected = false
    
    var body: some View {
        if !citySelected {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 40) {
                    
                    ForEach(cityList, id: \.self) { city in
                        Button(action: {
                            destCity = Location(id: city.id, name: city.name, latitude: city.latitude, longitude: city.longitude)
                            
                            citySelected.toggle()
                        }, label: {
                            Text(city.name)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        })
                    }
                    
    //                Button(action: {
    //                    destCity = Location(id: Cities().cottageGrove.id, name: Cities().cottageGrove.name, latitude: Cities().cottageGrove.latitude, longitude: Cities().cottageGrove.longitude)
    //
    //                    citySelected.toggle()
    //                }, label: {
    //                    Text("Cottage Grove, OR")
    //                        .font(.system(size: 30))
    //                        .fontWeight(.bold)
    //                        .foregroundColor(.black)
    //                })
    //
    //                Button(action: {
    //                    destCity = Location(id: Cities().newYork.id, name: Cities().newYork.name, latitude: Cities().newYork.latitude, longitude: Cities().newYork.longitude)
    //                    citySelected.toggle()
    //                }, label: {
    //                    Text("New York, NY")
    //                        .font(.system(size: 30))
    //                        .fontWeight(.bold)
    //                        .foregroundColor(.black)
    //                })
    //
    //                Button(action: {
    //                    destCity = Location(id: Cities().boston.id, name: Cities().boston.name, latitude: Cities().boston.latitude, longitude: Cities().boston.longitude)
    //                    citySelected.toggle()
    //                }, label: {
    //                    Text("Boston, MA")
    //                        .font(.system(size: 30))
    //                        .fontWeight(.bold)
    //                        .foregroundColor(.black)
    //                })
    //
    //                Button(action: {
    //                    destCity = Location(id: Cities().chicago.id, name: Cities().chicago.name, latitude: Cities().chicago.latitude, longitude: Cities().chicago.longitude)
    //                    citySelected.toggle()
    //                }, label: {
    //                    Text("Chicago, IL")
    //                        .font(.system(size: 30))
    //                        .fontWeight(.bold)
    //                        .foregroundColor(.black)
    //                })
    //
    //                Button(action: {
    //                    destCity = Location(id: Cities().losAngeles.id, name: Cities().losAngeles.name, latitude: Cities().losAngeles.latitude, longitude: Cities().losAngeles.longitude)
    //                    citySelected.toggle()
    //                }, label: {
    //                    Text("Los Angeles, CA")
    //                        .font(.system(size: 30))
    //                        .fontWeight(.bold)
    //                        .foregroundColor(.black)
    //                })
                    
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


