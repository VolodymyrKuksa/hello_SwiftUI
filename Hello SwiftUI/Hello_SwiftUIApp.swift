//
//  Hello_SwiftUIApp.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 20/12/20.
//

import SwiftUI

@main
struct Hello_SwiftUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            CategoryHomeView()
                .environmentObject(UserData())
        }
    }
}
