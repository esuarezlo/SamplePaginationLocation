//
//  CurrentLocationButtonView.swift
//  SamplePagination
//
//  Created by erns on 14/11/24.
//

import SwiftUI
import CoreLocationUI

struct CurrentLocationButtonView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        HStack{
            if let place = locationManager.place{
                Text("\(place)")
            }
            
            if #available(iOS 15.0, *){
                LocationButton(.currentLocation){
                    locationManager.requestLocation()
                }
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .labelStyle(.iconOnly)
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .font(.system(size: 12))
            }
        }
    }
}

