//
//  StrokeText.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import SwiftUI

struct StrokeText: View {
    
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack {
            ZStack {
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
