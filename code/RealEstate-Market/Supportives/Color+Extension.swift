//
//  Color+Extension.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import Foundation
import SwiftUI

extension Color {
    
    init(hex: String) {
        
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
