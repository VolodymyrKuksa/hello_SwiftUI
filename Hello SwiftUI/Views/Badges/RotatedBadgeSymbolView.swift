//
//  RotatedBadgeSymbolView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 27/12/20.
//

import SwiftUI

struct RotatedBadgeSymbolView: View {
    
    let angle: Angle
        
    var body: some View {
        BadgeSymbolView()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbolView(angle: .init(degrees: 5))
    }
}
