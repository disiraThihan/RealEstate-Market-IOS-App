//
//  AddRealEstateView.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-06.
//

//import SwiftUI
//import Firebase
//
//struct AddRealEstateView: View {
//    @ObservedObject var viewModel: RealEstateViewModel
//    @State private var title = ""
//    @State private var description = ""
//    @State private var imageURL = ""
//    @State private var price = ""
//    @State private var location = ""
//    @State private var rating = ""
//    @State private var type = ""
//    @State private var isFavorite = false
//    @State private var size = ""
//    @State private var bedrooms = ""
//    @State private var bathrooms = ""
//    @State private var yearBuilt = ""
//
//    var realEstateToEdit: RealEstate? // New property to hold the real estate being edited
//
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Property Details")) {
//                    TextField("Title", text: $title)
//                    TextField("Description", text: $description)
//                    TextField("Image URL", text: $imageURL)
//                    TextField("Price", text: $price)
//                        .keyboardType(.numberPad)
//                    TextField("Location", text: $location)
//                    TextField("Rating", text: $rating)
//                        .keyboardType(.numberPad)
//                    TextField("Type", text: $type)
//                    Toggle(isOn: $isFavorite) {
//                        Text("Best Deal")
//                    }
//                    TextField("Size (sq ft)", text: $size)
//                        .keyboardType(.numberPad)
//                    TextField("Bedrooms", text: $bedrooms)
//                        .keyboardType(.numberPad)
//                    TextField("Bathrooms", text: $bathrooms)
//                        .keyboardType(.numberPad)
//                    TextField("Year Built", text: $yearBuilt)
//                        .keyboardType(.numberPad)
//                }
//            }
//            .navigationBarTitle(realEstateToEdit != nil ? "Edit Real Estate" : "Add A Property", displayMode: .inline) // Update navigation title
//            .navigationBarItems(leading: Button("Cancel") {
//                presentationMode.wrappedValue.dismiss()
//            }, trailing: Button("Save") {
//                guard let price = Int(price),
//                      let rating = Int(rating),
//                      let size = Int(size),
//                      let bedrooms = Int(bedrooms),
//                      let bathrooms = Int(bathrooms),
//                      let yearBuilt = Int(yearBuilt) else {
//                    return
//                }
//
//                let realEstate = RealEstate(id: realEstateToEdit?.id ?? UUID().uuidString, // Use existing id if editing, otherwise generate new id
//                                             idUser: Auth.auth().currentUser?.uid ?? "",
//                                             title: title,
//                                             description: description,
//                                             imageURL: imageURL,
//                                             price: price,
//                                             location: location,
//                                             rating: rating,
//                                             type: type,
//                                             isFavorite: isFavorite,
//                                             size: size,
//                                             bedrooms: bedrooms,
//                                             bathrooms: bathrooms,
//                                             yearBuilt: yearBuilt)
//                
//                if let realEstateToEdit = realEstateToEdit {
//                    // Update existing real estate
//                    viewModel.updateRealEstate(realEstate: realEstate) { success, error in
//                        if success {
//                            presentationMode.wrappedValue.dismiss()
//                        } else if let error = error {
//                            print("Error updating real estate: \(error)")
//                        }
//                    }
//                } else {
//                    // Add new real estate
//                    viewModel.addRealEstate(realEstate: realEstate) { success, error in
//                        if success {
//                            presentationMode.wrappedValue.dismiss()
//                        } else if let error = error {
//                            print("Error adding real estate: \(error)")
//                        }
//                    }
//                }
//            })
//            .onAppear {
//                if let realEstateToEdit = realEstateToEdit {
//                    // Populate fields if editing an existing real estate
//                    title = realEstateToEdit.title
//                    description = realEstateToEdit.description
//                    imageURL = realEstateToEdit.imageURL
//                    price = "\(realEstateToEdit.price)"
//                    location = realEstateToEdit.location
//                    rating = "\(realEstateToEdit.rating)"
//                    type = realEstateToEdit.type
//                    isFavorite = realEstateToEdit.isFavorite
//                    size = "\(realEstateToEdit.size)"
//                    bedrooms = "\(realEstateToEdit.bedrooms)"
//                    bathrooms = "\(realEstateToEdit.bathrooms)"
//                    yearBuilt = "\(realEstateToEdit.yearBuilt)"
//                }
//            }
//        }
//    }
//}
//
//
//struct AddRealEstateView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRealEstateView(viewModel: RealEstateViewModel())
//    }
//}

//import SwiftUI
//import Firebase
//
//struct AddRealEstateView: View {
//    @ObservedObject var viewModel: RealEstateViewModel
//    @State private var title = ""
//    @State private var description = ""
//    @State private var imageURL = ""
//    @State private var price = ""
//    @State private var location = ""
//    @State private var rating = ""
//    @State private var type = ""
//    @State private var isFavorite = false
//    @State private var size = ""
//    @State private var bedrooms = ""
//    @State private var bathrooms = ""
//    @State private var yearBuilt = ""
//
//    var realEstateToEdit: RealEstate?
//
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section() {
//                    CustomTextField(placeholder: "Title", text: $title)
//                    CustomTextField(placeholder: "Description", text: $description)
//                    CustomTextField(placeholder: "Image URL", text: $imageURL)
//                    CustomTextField(placeholder: "Price", text: $price)
//                        .keyboardType(.numberPad)
//                    CustomTextField(placeholder: "Location", text: $location)
//                    CustomTextField(placeholder: "Rating", text: $rating)
//                        .keyboardType(.numberPad)
//                    CustomTextField(placeholder: "Type", text: $type)
//                    Toggle(isOn: $isFavorite) {
//                        Text("Best Deal")
//                    }
//                    CustomTextField(placeholder: "Size (sq ft)", text: $size)
//                        .keyboardType(.numberPad)
//                    CustomTextField(placeholder: "Bedrooms", text: $bedrooms)
//                        .keyboardType(.numberPad)
//                    CustomTextField(placeholder: "Bathrooms", text: $bathrooms)
//                        .keyboardType(.numberPad)
//                    CustomTextField(placeholder: "Year Built", text: $yearBuilt)
//                        .keyboardType(.numberPad)
//                }
//                .padding(.vertical, 10)
//            }
//            .navigationBarTitle(realEstateToEdit != nil ? "Edit Real Estate" : "Add A Property", displayMode: .inline)
//            .navigationBarItems(leading: Button("Cancel") {
//                presentationMode.wrappedValue.dismiss()
//            }, trailing: Button("Save") {
//                guard let price = Int(price),
//                      let rating = Int(rating),
//                      let size = Int(size),
//                      let bedrooms = Int(bedrooms),
//                      let bathrooms = Int(bathrooms),
//                      let yearBuilt = Int(yearBuilt) else {
//                    return
//                }
//
//                let realEstate = RealEstate(id: realEstateToEdit?.id ?? UUID().uuidString,
//                                             idUser: Auth.auth().currentUser?.uid ?? "",
//                                             title: title,
//                                             description: description,
//                                             imageURL: imageURL,
//                                             price: price,
//                                             location: location,
//                                             rating: rating,
//                                             type: type,
//                                             isFavorite: isFavorite,
//                                             size: size,
//                                             bedrooms: bedrooms,
//                                             bathrooms: bathrooms,
//                                             yearBuilt: yearBuilt)
//                
//                if let realEstateToEdit = realEstateToEdit {
//                    viewModel.updateRealEstate(realEstate: realEstate) { success, error in
//                        if success {
//                            presentationMode.wrappedValue.dismiss()
//                        } else if let error = error {
//                            print("Error updating real estate: \(error)")
//                        }
//                    }
//                } else {
//                    viewModel.addRealEstate(realEstate: realEstate) { success, error in
//                        if success {
//                            presentationMode.wrappedValue.dismiss()
//                        } else if let error = error {
//                            print("Error adding real estate: \(error)")
//                        }
//                    }
//                }
//            })
//            .onAppear {
//                if let realEstateToEdit = realEstateToEdit {
//                    title = realEstateToEdit.title
//                    description = realEstateToEdit.description
//                    imageURL = realEstateToEdit.imageURL
//                    price = "\(realEstateToEdit.price)"
//                    location = realEstateToEdit.location
//                    rating = "\(realEstateToEdit.rating)"
//                    type = realEstateToEdit.type
//                    isFavorite = realEstateToEdit.isFavorite
//                    size = "\(realEstateToEdit.size)"
//                    bedrooms = "\(realEstateToEdit.bedrooms)"
//                    bathrooms = "\(realEstateToEdit.bathrooms)"
//                    yearBuilt = "\(realEstateToEdit.yearBuilt)"
//                }
//            }
//        }
//    }
//}
//
//struct CustomTextField: View {
//    var placeholder: String
//    @Binding var text: String
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            Text(placeholder)
//                .font(.caption)
//                .foregroundColor(.secondary)
//            TextField("", text: $text)
//                .padding(10)
//                .background(Color(.secondarySystemBackground))
//                .cornerRadius(8)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
//                )
//        }
//        .padding(.vertical, 5)
//    }
//}
//
//struct AddRealEstateView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRealEstateView(viewModel: RealEstateViewModel())
//    }
//}

import SwiftUI
import Firebase

struct AddRealEstateView: View {
    @ObservedObject var viewModel: RealEstateViewModel
    @State private var title = ""
    @State private var description = ""
    @State private var imageURL = ""
    @State private var price = ""
    @State private var location = ""
    @State private var rating = ""
    @State private var type = ""
    @State private var isFavorite = false
    @State private var size = ""
    @State private var bedrooms = ""
    @State private var bathrooms = ""
    @State private var yearBuilt = ""
    
    @State private var titleError = ""
    @State private var descriptionError = ""
    @State private var imageURLError = ""
    @State private var priceError = ""
    @State private var locationError = ""
    @State private var ratingError = ""
    @State private var typeError = ""
    @State private var sizeError = ""
    @State private var bedroomsError = ""
    @State private var bathroomsError = ""
    @State private var yearBuiltError = ""

    var realEstateToEdit: RealEstate?

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section() {
                    CustomTextField(placeholder: "Title", text: $title, validationError: titleError)
                    CustomTextField(placeholder: "Description", text: $description, validationError: descriptionError)
                    CustomTextField(placeholder: "Image URL", text: $imageURL, validationError: imageURLError)
                    CustomTextField(placeholder: "Price", text: $price, validationError: priceError)
                        .keyboardType(.numberPad)
                    CustomTextField(placeholder: "Location", text: $location, validationError: locationError)
                    CustomTextField(placeholder: "Rating", text: $rating, validationError: ratingError)
                        .keyboardType(.numberPad)
                    CustomTextField(placeholder: "Type", text: $type, validationError: typeError)
                    Toggle(isOn: $isFavorite) {
                        Text("Best Deal")
                    }
                    CustomTextField(placeholder: "Size (sq ft)", text: $size, validationError: sizeError)
                        .keyboardType(.numberPad)
                    CustomTextField(placeholder: "Bedrooms", text: $bedrooms, validationError: bedroomsError)
                        .keyboardType(.numberPad)
                    CustomTextField(placeholder: "Bathrooms", text: $bathrooms, validationError: bathroomsError)
                        .keyboardType(.numberPad)
                    CustomTextField(placeholder: "Year Built", text: $yearBuilt, validationError: yearBuiltError)
                        .keyboardType(.numberPad)
                }
                .padding(.vertical, 10)
            }
            .navigationBarTitle(realEstateToEdit != nil ? "Edit Real Estate" : "Add A Property", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                validateFields()
                
                guard titleError.isEmpty,
                      descriptionError.isEmpty,
                      imageURLError.isEmpty,
                      priceError.isEmpty,
                      locationError.isEmpty,
                      ratingError.isEmpty,
                      typeError.isEmpty,
                      sizeError.isEmpty,
                      bedroomsError.isEmpty,
                      bathroomsError.isEmpty,
                      yearBuiltError.isEmpty else {
                    return
                }
                
                guard let price = Int(price),
                      let rating = Int(rating),
                      let size = Int(size),
                      let bedrooms = Int(bedrooms),
                      let bathrooms = Int(bathrooms),
                      let yearBuilt = Int(yearBuilt) else {
                    return
                }

                let realEstate = RealEstate(id: realEstateToEdit?.id ?? UUID().uuidString,
                                             idUser: Auth.auth().currentUser?.uid ?? "",
                                             title: title,
                                             description: description,
                                             imageURL: imageURL,
                                             price: price,
                                             location: location,
                                             rating: rating,
                                             type: type,
                                             isFavorite: isFavorite,
                                             size: size,
                                             bedrooms: bedrooms,
                                             bathrooms: bathrooms,
                                             yearBuilt: yearBuilt)
                
                if let realEstateToEdit = realEstateToEdit {
                    viewModel.updateRealEstate(realEstate: realEstate) { success, error in
                        if success {
                            presentationMode.wrappedValue.dismiss()
                        } else if let error = error {
                            print("Error updating real estate: \(error)")
                        }
                    }
                } else {
                    viewModel.addRealEstate(realEstate: realEstate) { success, error in
                        if success {
                            presentationMode.wrappedValue.dismiss()
                        } else if let error = error {
                            print("Error adding real estate: \(error)")
                        }
                    }
                }
            })
            .onAppear {
                if let realEstateToEdit = realEstateToEdit {
                    title = realEstateToEdit.title
                    description = realEstateToEdit.description
                    imageURL = realEstateToEdit.imageURL
                    price = "\(realEstateToEdit.price)"
                    location = realEstateToEdit.location
                    rating = "\(realEstateToEdit.rating)"
                    type = realEstateToEdit.type
                    isFavorite = realEstateToEdit.isFavorite
                    size = "\(realEstateToEdit.size)"
                    bedrooms = "\(realEstateToEdit.bedrooms)"
                    bathrooms = "\(realEstateToEdit.bathrooms)"
                    yearBuilt = "\(realEstateToEdit.yearBuilt)"
                }
            }
        }
    }
    
    func validateFields() {
        titleError = title.isEmpty ? "Title is required" : ""
        descriptionError = description.isEmpty ? "Description is required" : ""
        imageURLError = imageURL.isEmpty ? "Image URL is required" : ""
        priceError = price.isEmpty ? "Price is required" : ""
        locationError = location.isEmpty ? "Location is required" : ""
        ratingError = rating.isEmpty ? "Rating is required" : ""
        typeError = type.isEmpty ? "Type is required" : ""
        sizeError = size.isEmpty ? "Size is required" : ""
        bedroomsError = bedrooms.isEmpty ? "Bedrooms is required" : ""
        bathroomsError = bathrooms.isEmpty ? "Bathrooms is required" : ""
        yearBuiltError = yearBuilt.isEmpty ? "Year Built is required" : ""
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var validationError: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(placeholder)
                .font(.caption)
                .foregroundColor(.secondary)
            TextField("", text: $text)
                .padding(10)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(validationError.isEmpty ? Color.gray.opacity(0.4) : Color.red, lineWidth: 1)
                )
            if !validationError.isEmpty {
                Text(validationError)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 5)
    }
}

struct AddRealEstateView_Previews: PreviewProvider {
    static var previews: some View {
        AddRealEstateView(viewModel: RealEstateViewModel())
    }
}
