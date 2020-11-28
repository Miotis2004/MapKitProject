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


