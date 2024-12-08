//
//  RealEstateViewModel.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-06.
//

import Foundation
import Firebase

class RealEstateViewModel: ObservableObject {
    @Published var realEstates: [RealEstate] = []


    // Fetch all real estate properties
    func fetchAllRealEstatesAll(completion: @escaping ([RealEstate]?, Error?) -> Void) {
        let db = Firestore.firestore()
        db.collection("realEstates").getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(nil, error)
            } else {
                var realEstates = [RealEstate]()
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let id = document.documentID
                    let idUser = data["idUser"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let imageURL = data["imageURL"] as? String ?? ""
                    let price = data["price"] as? Int ?? 0
                    let location = data["location"] as? String ?? ""
                    let rating = data["rating"] as? Int ?? 0
                    let type = data["type"] as? String ?? ""
                    let isFavorite = data["isFavorite"] as? Bool ?? false
                    let size = data["size"] as? Int ?? 0
                    let bedrooms = data["bedrooms"] as? Int ?? 0
                    let bathrooms = data["bathrooms"] as? Int ?? 0
                    let yearBuilt = data["yearBuilt"] as? Int ?? 0
                    let realEstate = RealEstate(id: id, idUser: idUser, title: title, description: description, imageURL: imageURL, price: price, location: location, rating: rating, type: type, isFavorite: isFavorite, size: size, bedrooms: bedrooms, bathrooms: bathrooms, yearBuilt: yearBuilt)
                    realEstates.append(realEstate)
                }
                completion(realEstates, nil)
            }
        }
    }


    // Add a new real estate property
    func addRealEstate(realEstate: RealEstate, completion: @escaping (Bool, Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(false, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "The user has not logged in."]))
            return
        }
        
        let db = Firestore.firestore()
        db.collection("realEstates").addDocument(data: [
            "idUser": userId,
            "title": realEstate.title,
            "description": realEstate.description,
            "imageURL": realEstate.imageURL,
            "price": realEstate.price,
            "location": realEstate.location,
            "rating": realEstate.rating,
            "type": realEstate.type,
            "isFavorite": realEstate.isFavorite,
            "size": realEstate.size,
            "bedrooms": realEstate.bedrooms,
            "bathrooms": realEstate.bathrooms,
            "yearBuilt": realEstate.yearBuilt,
            "createdAt": FieldValue.serverTimestamp()
        ]) { error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    // Fetch real estate properties for the current user
    func fetchRealEstates(completion: @escaping ([RealEstate]?, Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "The user has not logged in."]))
            return
        }
        
        let db = Firestore.firestore()
        db.collection("realEstates")
          .whereField("idUser", isEqualTo: userId)
          .getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(nil, error)
            } else {
                var realEstates = [RealEstate]()
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let id = document.documentID
                    let idUser = data["idUser"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let imageURL = data["imageURL"] as? String ?? ""
                    let price = data["price"] as? Int ?? 0
                    let location = data["location"] as? String ?? ""
                    let rating = data["rating"] as? Int ?? 0
                    let type = data["type"] as? String ?? ""
                    let isFavorite = data["isFavorite"] as? Bool ?? false
                    let size = data["size"] as? Int ?? 0
                    let bedrooms = data["bedrooms"] as? Int ?? 0
                    let bathrooms = data["bathrooms"] as? Int ?? 0
                    let yearBuilt = data["yearBuilt"] as? Int ?? 0
                    let realEstate = RealEstate(id: id, idUser: idUser, title: title, description: description, imageURL: imageURL, price: price, location: location, rating: rating, type: type, isFavorite: isFavorite, size: size, bedrooms: bedrooms, bathrooms: bathrooms, yearBuilt: yearBuilt)
                    realEstates.append(realEstate)
                }
                completion(realEstates, nil)
            }
        }
    }
    
    // Update a real estate property
    func updateRealEstate(realEstate: RealEstate, completion: @escaping (Bool, Error?) -> Void) {
        let db = Firestore.firestore()
        let realEstateRef = db.collection("realEstates").document(realEstate.id)

        realEstateRef.updateData([
            "title": realEstate.title,
            "description": realEstate.description,
            "imageURL": realEstate.imageURL,
            "price": realEstate.price,
            "location": realEstate.location,
            "rating": realEstate.rating,
            "type": realEstate.type,
            "isFavorite": realEstate.isFavorite,
            "size": realEstate.size,
            "bedrooms": realEstate.bedrooms,
            "bathrooms": realEstate.bathrooms,
            "yearBuilt": realEstate.yearBuilt
        ]) { error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    // Delete a real estate property
    func deleteRealEstate(realEstateId: String, completion: @escaping (Bool, Error?) -> Void) {
        let db = Firestore.firestore()
        let realEstateRef = db.collection("realEstates").document(realEstateId)
        
        realEstateRef.delete { error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    // Fetch the document ID for a specific real estate property
    func fetchRealEstateId(for realEstate: RealEstate, completion: @escaping (String?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }
        
        let db = Firestore.firestore()
        db.collection("realEstates")
            .whereField("idUser", isEqualTo: userId)
            .whereField("title", isEqualTo: realEstate.title)
            .whereField("description", isEqualTo: realEstate.description)
            .whereField("price", isEqualTo: realEstate.price)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching real estate ID: \(error.localizedDescription)")
                    completion(nil)
                } else {
                    if let document = querySnapshot?.documents.first {
                        let realEstateId = document.documentID
                        completion(realEstateId)
                    } else {
                        print("Real estate not found.")
                        completion(nil)
                    }
                }
            }
    }
}
