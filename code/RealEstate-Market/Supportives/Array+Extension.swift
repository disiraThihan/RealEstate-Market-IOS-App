//
//  Array+Extension.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
