//
//  LandmarkView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 24/12/20.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    @EnvironmentObject var userData: UserData
    
    let landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex { l in
            l.id == landmark.id
        }!
    }
    
    var body: some View {
        VStack {
            MapView(coordinates: landmark.coordinates)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            let imageOffset: CGFloat = -130
            CircleImageView(imageName: landmark.imageName)
                .offset(y: imageOffset)
                .padding(.bottom, imageOffset)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        userData.landmarks[landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack {
                    
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: UserData().landmarks[0])
            .environmentObject(UserData())
    }
}
