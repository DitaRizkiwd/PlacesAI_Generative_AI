//
//  PlaceRowView.swift
//  PlacesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import SwiftUI

struct PlaceRowView: View {
    var place: PlaceModel
    var body: some View {
        VStack(alignment: . leading, spacing: 16){
            Text(place.activity)
                .font(.system(.title2, design: .rounded))
            HStack{
                Group{
                    Image(systemName: "pin")
                    Text(place.place)
                }
                .font(.subheadline)
                Spacer()
                HStack{
                    Circle()
                        .fill(.cyan)
                        .frame(width: 20, height: 20)
                    
                    Text("Rp\(place.price)")
                        .font(.subheadline)
                }
                .padding(8)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    PlaceRowView(place: PlaceModel.dummyData[0])
        .padding()
}
