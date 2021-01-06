//
//  MapView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 20/12/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let coordinates: Coordinates
    
    func makeUIView(context: Context) -> some UIView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let mapView = uiView as? MKMapView {
            let coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: Coordinates(latitude: 34.011286, longitude: -116.166868))
    }
}
