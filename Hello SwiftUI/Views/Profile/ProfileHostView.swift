//
//  ProfileHostView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 3/01/21.
//

import SwiftUI

struct ProfileHostView: View {
    
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    private var profileBackup = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                if mode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = userData.profile
                        mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            
            if mode?.wrappedValue == .inactive {
                ProfileSummaryView(profile: userData.profile)
            }
            else {
                ProfileEditorView(profile: $draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHostView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHostView()
            .environmentObject(UserData())
    }
}
