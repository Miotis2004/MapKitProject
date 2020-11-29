//
//  ShowRoute.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import SwiftUI

struct ShowRoute: View {
    @State private var directions: [String] = []
    @State private var showDirections = false
    @State private var tripDist: [Double] = []
    
    @Binding var destCity: Location
    @Binding var originCity: Location
    @Binding var citySelected: Bool
    @Binding var originSelected: Bool
    
    var body: some View {
        Group {
            VStack {
                MapView(directions: $directions, tripDist: $tripDist, destCity: $destCity, originCity: $originCity)
                
                HStack {
                    Button(action: {
                        self.showDirections.toggle()
                    }, label: {
                        Text("Show Directions")
                    })
                    .disabled(directions.isEmpty)
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        citySelected = false
                        originSelected = false
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
            }
            .sheet(isPresented: $showDirections) {
                VStack {
                    Text("Directions")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Divider().background(Color.blue)
                    
                    List {
                        ForEach(0..<self.directions.count, id:\.self) { direction in
                            HStack {
                                Text("\(self.directions[direction])")
                                    .padding()
                                Spacer()
                                //Text(" \(tripDist[direction].rounded())mi")
                                Text("\(String(format: "%.2f", (tripDist[direction]/1000))) mi")
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

//struct ShowRoute_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowRoute(destCity: Cities().boston)
//    }
//}
