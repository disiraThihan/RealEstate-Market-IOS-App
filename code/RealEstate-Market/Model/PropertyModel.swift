//
//  PropertyModel.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import Foundation
import FirebaseFirestoreSwift

struct RealEstate: Identifiable, Codable {
    let id: String
    let idUser: String
    let title: String
    let description: String
    let imageURL: String
    let price: Int
    let location: String
    let rating: Int
    let type: String
    let isFavorite: Bool
    let size: Int // Size in square feet
    let bedrooms: Int
    let bathrooms: Int
    let yearBuilt: Int
}


//extension RealEstate {
//
//    static func all() -> [RealEstate] {
//        return [
//            RealEstate(id:"", idUser: "",title: "Modern Family Home", description: "A beautiful family home located in the suburbs with a large backyard and modern amenities.", imageURL: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", price: 450000, location: "Suburbs", rating: 4, type: "sale", isFavorite: false, size: 2500, bedrooms: 4, bathrooms: 3, yearBuilt: 2015),
//            RealEstate(id:"", idUser: "",title: "Luxury Downtown Apartment", description: "A spacious luxury apartment in the heart of downtown with stunning city views.", imageURL: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", price: 950000, location: "Downtown", rating: 5, type: "sale", isFavorite: true, size: 1500, bedrooms: 2, bathrooms: 2, yearBuilt: 2020),
//            RealEstate(id:"", idUser: "",title: "Cozy Cottage", description: "A charming cottage located in the countryside, perfect for a weekend getaway.", imageURL: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", price: 300000, location: "Countryside", rating: 3, type: "sale", isFavorite: false, size: 1200, bedrooms: 2, bathrooms: 1, yearBuilt: 1995),
//            RealEstate(id:"", idUser: "",title: "Modern Office Space", description: "A modern office space located in the business district, equipped with all necessary facilities.", imageURL: "officeSpace", price: 750000, location: "Business District", rating: 4, type: "sale", isFavorite: true, size: 2000, bedrooms: 0, bathrooms: 2, yearBuilt: 2018),
//            RealEstate(id:"", idUser: "",title: "Beachfront Villa", description: "A luxurious villa with private beach access and stunning ocean views.", imageURL: "beachVilla", price: 1200000, location: "Beachfront", rating: 5, type: "new", isFavorite: true, size: 3500, bedrooms: 5, bathrooms: 4, yearBuilt: 2022),
//            RealEstate(id:"", idUser: "",title: "Urban Loft", description: "A stylish urban loft with open floor plan and modern industrial design.", imageURL: "urbanLoft", price: 500000, location: "City Center", rating: 4, type: "new", isFavorite: false, size: 1300, bedrooms: 1, bathrooms: 1, yearBuilt: 2021),
//            RealEstate(id:"", idUser: "",title: "Historic Townhouse", description: "A beautifully restored townhouse with original features and modern updates.", imageURL: "townhouse", price: 650000, location: "Old Town", rating: 4, type: "new", isFavorite: true, size: 2200, bedrooms: 3, bathrooms: 2, yearBuilt: 1900)
//        ]
//    }
//}
