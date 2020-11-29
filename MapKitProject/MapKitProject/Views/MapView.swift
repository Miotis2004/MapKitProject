//
//  MapView.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var directions: [String]
    @Binding var destCity: Location
    
    typealias UIViewType = MKMapView
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        mapView.setRegion(region, animated: true)
        
        //Atlanta Placemark - Starting Placemark
        let placemarkAtlanta = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880))
        
        //Destination Placemark
        let placemarkOregon = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: destCity.lat, longitude: destCity.lng))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: placemarkAtlanta)
        request.destination = MKMapItem(placemark: placemarkOregon)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            
            mapView.addAnnotations([placemarkAtlanta, placemarkOregon])
            
            mapView.addOverlay(route.polyline)
            
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
            
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}
