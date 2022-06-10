//
//  RoundedCornersShape.swift
//  stepBy
//
//  Created by Lina on 07/11/1443 AH.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                   byRoundingCorners: corners,
                                   cornerRadii: CGSize(width: radius, height: radius))
           return Path(path.cgPath)
    }
    
    let corners: UIRectCorner
    let radius: CGFloat
}



