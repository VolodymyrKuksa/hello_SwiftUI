//
//  ProfileSummaryView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 3/01/21.
//

import SwiftUI

struct ProfileSummaryView: View {
    
    let profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        /*
        This is a hack that's supposed to emulate the behaviour of a List { ... }
        Otherwise functionality and animations of the HikeView will break 🤷‍♂️ 🤬
        */
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Text(profile.username)
                    .bold()
                    .font(.title)
                Divider()
                
                Group { // This is a hack to overcome the 10 element limit for VStack
                    Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                    Divider()
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Divider()
                    Text("Goal Date: \(profile.goalDate, formatter: Self.goalFormat)")
                    Divider()
                }
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            HikeBadgeView(name: "First Badge")
                            HikeBadgeView(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadgeView(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                    }
                    .frame(height: 140)
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: UserData().hikes[0])
                }
            }
        }
        .padding()
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: Profile.default)
    }
}
