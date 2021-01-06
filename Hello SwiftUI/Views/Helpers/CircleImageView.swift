//
//  CircleImage.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 20/12/20.
//

import SwiftUI

struct CircleImageView: View {
    
    let imageName: String
        
    var body: some View {
        Image(imageName)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 4)
            )
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(imageName: "turtlerock")
    }
}
