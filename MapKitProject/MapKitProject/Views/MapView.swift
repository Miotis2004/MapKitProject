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
    @Binding var tripDist: [Double]
    @Binding var destCity: Location
    @Binding var originCity: Location
    
    typealias UIViewType = MKMapView
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: originCity.lat, longitude: originCity.lng), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        mapView.setRegion(region, animated: true)
        
        //Atlanta Placemark - Starting Placemark
        let placemarkOrigin = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: originCity.lat, longitude: originCity.lng))
        
        //Destination Placemark
        let placemarkDestination = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: destCity.lat, longitude: destCity.lng))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: placemarkOrigin)
        request.destination = MKMapItem(placemark: placemarkDestination)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            
            mapView.addAnnotations([placemarkOrigin, placemarkDestination])
            
            mapView.addOverlay(route.polyline)
            
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
            
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
            self.tripDist = route.steps.map { $0.distance }
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}
