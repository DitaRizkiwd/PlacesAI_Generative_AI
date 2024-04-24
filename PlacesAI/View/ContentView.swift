//
//  ContentView.swift
//  PlacesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var placevm = PlaceViewModel()
    var body: some View {
        NavigationStack{
            List{
                ForEach(placevm.place, id:\.self){
                    item in PlaceRowView(place: item)
                }
            }
            .navigationTitle("Palembang")
            .overlay{
                placevm.place.isEmpty ? ProgressView() : nil
            }
            .task {
                await placevm.getPlaces()
            }
            .refreshable {
                await placevm.getPlaces()
            }
        }
    }
}

#Preview {
    ContentView()
}
