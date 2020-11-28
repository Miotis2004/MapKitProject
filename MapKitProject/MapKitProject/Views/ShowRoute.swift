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
    
    var body: some View {
        Group {
            VStack {
                MapView(directions: $directions)
                
                Button(action: {
                    self.showDirections.toggle()
                }, label: {
                    Text("Show Directions")
                })
                .disabled(directions.isEmpty)
                .padding()
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
                            Text("\(self.directions[direction])")
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct ShowRoute_Previews: PreviewProvider {
    static var previews: some View {
        ShowRoute()
    }
}
