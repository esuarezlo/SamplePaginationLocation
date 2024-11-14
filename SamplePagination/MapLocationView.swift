//
//  MapLocationView.swift
//  SamplePagination
//
//  Created by erns on 14/11/24.
//

import SwiftUI
import CoreLocationUI
import MapKit

struct MapLocationView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        ZStack(alignment: .bottom){
            Map(coordinateRegion: $locationManager.region,
            showsUserLocation: true)
            .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                if let location = locationManager.location{
                    Text("Location: \(location.latitude), \(location.longitude)")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Spacer()
                
                LocationButton(.currentLocation){
                    locationManager.requestLocation()
                }
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .cornerRadius(30)
            }
            .padding()           

            
            
        }
    }
}

