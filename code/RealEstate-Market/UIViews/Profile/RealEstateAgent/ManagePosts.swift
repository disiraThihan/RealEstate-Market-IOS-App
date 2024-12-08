//
//  ManagePosts.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-06.
//

import SwiftUI
import Firebase

struct RealEstateListView: View {
    @ObservedObject var viewModel = RealEstateViewModel()
    @State private var showingAddRealEstateView = false
    @State private var showingEditRealEstateView = false
    @State private var selectedRealEstate: RealEstate?
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.realEstates) { realEstate in
                    NavigationLink(destination: RealEstateDetailView(realEstate:realEstate,viewModel:viewModel)) {
                        RowList(realEstate: realEstate)
                    }
                }
            }
            .navigationTitle("Real Estates")
            .navigationBarItems(leading: Button(action: {
                do {
                    try Auth.auth().signOut()
                    presentationMode.wrappedValue.dismiss()
                } catch let error as NSError {
                    print("Error signing out: %@", error)
                }
            }) {
                Text("LogOut")
            }, trailing: Button(action: {
                showingAddRealEstateView.toggle()
            }) {
                Image(systemName: "plus")
            })
            .onAppear {
                viewModel.fetchRealEstates { (realEstates, error) in
                    if let realEstates = realEstates {
                        viewModel.realEstates = realEstates
                    } else if let error = error {
                        print("Error fetching real estates: \(error)")
                    }
                }
            }
            .sheet(isPresented: $showingAddRealEstateView) {
                AddRealEstateView(viewModel: viewModel)
            }
            .sheet(item: $selectedRealEstate) { realEstate in
                AddRealEstateView(viewModel: viewModel, realEstateToEdit: realEstate)
            }

        }
    }
}


struct RowList: View {
    let realEstate: RealEstate

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: realEstate.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 100)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 100)
                }

                VStack(alignment: .leading) {
                    Text(realEstate.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(realEstate.location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("LKR \(realEstate.price)")
                        .font(.body)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            Divider()
        }
        .padding(.vertical, 8)
    }
}

struct RealEstateDetailView: View {
    let realEstate: RealEstate
    @ObservedObject var viewModel: RealEstateViewModel
    @State private var showingEditRealEstateView = false
    @State private var showingDeleteAlert = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: realEstate.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .aspectRatio(contentMode: .fit)
                }
                .cornerRadius(12)
                .frame(height: 300)
                .clipped()
                .padding()
                .shadow(radius: 10)

                Text(realEstate.title)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.horizontal)
                                    .padding(.top, 5)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundColor(.secondary)
                                    Text(realEstate.location)
                                        .font(.title2)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)

                                HStack {
                                    Image(systemName: "tag.fill")
                                        .foregroundColor(.secondary)
                                    Text("LKR \(realEstate.price)")
                                        .font(.title2)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)

                                Text("Description")
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .padding(.top, 8)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text(realEstate.description)
                                    .font(.body)
                                    .padding(.horizontal)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack{
                    Text("Number of Bath Rooms:")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                        .foregroundColor(.brown)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                    Text("\(realEstate.bathrooms)")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                        .foregroundColor(.orange)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                }
                
                HStack{
                    Text("Number of Bed Rooms:")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                        .foregroundColor(.brown)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                    Text("\(realEstate.bedrooms)")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                        .foregroundColor(.orange)
                        .padding(.top, 10)
                        .padding(.horizontal, 15)
                }
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .navigationTitle("Real Estate Detail")
        .navigationBarItems(trailing: HStack {
            Button(action: {
                showingEditRealEstateView.toggle()
            }) {
                Image(systemName: "pencil")
            }
            .sheet(isPresented: $showingEditRealEstateView) {
                AddRealEstateView(viewModel: viewModel, realEstateToEdit: realEstate)
            }
            
            Button(action: {
                showingDeleteAlert = true
            }) {
                Image(systemName: "trash")
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(
                    title: Text("Delete Real Estate"),
                    message: Text("Are you sure you want to delete this real estate?"),
                    primaryButton: .destructive(Text("Delete")) {
                        viewModel.deleteRealEstate(realEstateId: realEstate.id) { success, error in
                            if success {
                                // Navigate back after deletion
                                presentationMode.wrappedValue.dismiss()
                            } else if let error = error {
                                print("Error deleting real estate: \(error)")
                            }
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        })
    }
}



struct RealEstateListView_Previews: PreviewProvider {
    static var previews: some View {
        RealEstateListView()
    }
}
