//
//  CategoryRowView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 3/01/21.
//

import SwiftUI

struct CategoryRowView: View {
    
    let categoryName: String
    let items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
                .frame(height: 185)
            }
            
        }
    }
}


struct CategoryItem: View {
    
    let landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(landmark.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


struct CategoryRowView_Previews: PreviewProvider {
    static let userData = UserData()
    
    static var previews: some View {
        ForEach(Landmark.Category.allCases, id: \.self) { category in
            NavigationView {
                CategoryRowView(
                    categoryName: category.rawValue,
                    items: userData.landmarks.filter { $0.category == category })
            }
            .environmentObject(UserData())
        }
    }
    
}

