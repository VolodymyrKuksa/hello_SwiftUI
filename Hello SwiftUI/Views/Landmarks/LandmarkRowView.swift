//
//  LandmarkRowView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 24/12/20.
//

import SwiftUI

struct LandmarkRowView: View {
    
    let landmark: Landmark
    
    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if (landmark.isFavorite)
            {
                Image(systemName: "star.fill")
                    .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    
    static let landmarkList = UserData().landmarks
    
    static var previews: some View {
    
        Group {
            LandmarkRowView(landmark: Self.landmarkList[0])
            LandmarkRowView(landmark: Self.landmarkList[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
