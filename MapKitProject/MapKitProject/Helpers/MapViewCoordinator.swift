//
//  MapViewCoordinator.swift
//  MapKitProject
//
//  Created by Ronald Joubert on 11/28/20.
//

import SwiftUI
import MapKit

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .blue
        renderer.lineWidth = 5
        return renderer
    }
    
}
