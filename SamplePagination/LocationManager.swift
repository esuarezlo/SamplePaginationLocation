//
//  LocationManager.swift
//  SamplePagination
//
//  Created by erns on 14/11/24.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    private let manager = CLLocationManager()
    
    @Published var place:String?
    @Published var location: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )

    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {return}
        
        DispatchQueue.main.async{
            self.location = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        }
        
        lookUpCurrentLocation{placemark in
            self.place = placemark
        }
        
    }
    
    func lookUpCurrentLocation(completionHandler:@escaping (String?) ->Void){
        
        if let lastLocation = manager.location{
            let geocoder = CLGeocoder()
            
            geocoder.reverseGeocodeLocation(lastLocation,completionHandler:{ placemarks, error in
                
                if error == nil{
                    let firstLocation = placemarks?[0].name
                    completionHandler(firstLocation)
                    
                }
                else{
                    completionHandler(nil)
                }
            })
        }
        else{
            completionHandler(nil)
        }
        
    }
    
    func locationManager(_ manager:CLLocationManager, didFailWithError error:Error){
        print("Error requesting location.")
    }
    
    
}
