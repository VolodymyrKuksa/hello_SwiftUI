//
//  BadgeBackgroundView.swift
//  Hello SwiftUI
//
//  Created by VolodymyrKuksa on 27/12/20.
//

import SwiftUI

struct BadgeBackgroundView: View {
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
    var body: some View {
        
        GeometryReader { geometry in
            Path { path in
                
                var width = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach { point in
                    path.addLine(
                        to: .init(
                            x: xOffset + width * point.useWidth.0 * point.xFactors.0,
                            y: height * point.useHeight.0 * point.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                       to: .init(
                           x: xOffset + width * point.useWidth.1 * point.xFactors.1,
                           y: height * point.useHeight.1 * point.yFactors.1
                       ),
                       control: .init(
                           x: xOffset + width * point.useWidth.2 * point.xFactors.2,
                           y: height * point.useHeight.2 * point.yFactors.2
                       )
                   )
                }
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct BadgeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackgroundView()
    }
}
