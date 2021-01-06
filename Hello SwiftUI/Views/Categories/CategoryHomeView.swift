//
//  CategoryHomeView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 3/01/21.
//

import SwiftUI

struct CategoryHomeView: View {
    
    @EnvironmentObject var userData: UserData
    @State var showingProfile = false
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: userData.landmarks) { $0.category.rawValue }
    }
    
    var featured: [Landmark] {
        userData.landmarks.filter { $0.isFeatured }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, items: categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkListView()) {
                    Text("See All")
                }
            }
            .navigationBarTitle("Featured")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHostView()
            }
        }
    }
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
}


struct FeaturedLandmarks: View {
    
    let landmarks: [Landmark]
    
    var body: some View {
        Image(landmarks[0].imageName)
            .resizable()
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHomeView()
            .environmentObject(UserData())
    }
}
