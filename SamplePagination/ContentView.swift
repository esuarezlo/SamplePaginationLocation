//
//  ContentView.swift
//  SamplePagination
//
//  Created by erns on 16/10/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    private let frutas=["pera","manzana","mango","durazno","fresa","sandia","uva","chirimoya","higo","granadilla","membrillo","lucuma","melocoton","ciruela","pera 2","manzana 2","mango 2","durazno 2","fresa 2","sandia 2","uva 2","chirimoya 2","higo 2","granadilla 2","membrillo 2","lucuma 2","melocoton 2","ciruela 2","pera 3","manzana 3","mango 3","durazno 3","fresa 3","sandia 3","uva 3","chirimoya 3","higo 3","granadilla 3","membrillo 3","lucuma 3","melocoton 3","ciruela 3"]
    
    var body: some View {
        ScrollView {
            
            LazyVStack{
                ForEach(frutas,id: \.self){item in
                    Text(item.description)
                        .Logger(item)
                    
                }
            }
            
            
        }
        
        .padding()
    }
    

}

extension View {
    func Logger(_ item: Any) -> some View {
        #if DEBUG
        print(item)
        #endif
        return self
    }
}
/*
#Preview {
    ContentView()
}*/
