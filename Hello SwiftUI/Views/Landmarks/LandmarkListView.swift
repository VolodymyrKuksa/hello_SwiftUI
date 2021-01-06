//
//  LandmarkListView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 24/12/20.
//

import SwiftUI

struct LandmarkListView: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites Only")
            }
            
            ForEach(userData.landmarks) { landmark in
                if (!userData.showFavoritesOnly || landmark.isFavorite)
                {
                    let detailsView = LandmarkDetailView(landmark: landmark)
                        .environmentObject(userData)
                    NavigationLink(destination: detailsView) {
                        LandmarkRowView(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkListView()
                .environmentObject(UserData())
        }
    }
}
