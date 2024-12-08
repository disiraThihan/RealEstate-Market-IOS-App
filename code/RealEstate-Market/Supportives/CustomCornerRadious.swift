//
//  CustomCornerRadious.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import Foundation
import SwiftUI

struct rounded : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
