//
//  PropertyListView.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//


import SwiftUI
import PartialSheet

struct PropertyListView: View {
    
    @ObservedObject var viewModel = RealEstateViewModel()
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: 45)
        .overlay(
            Text("Properties")
                .font(.headline)
                .padding(.horizontal, 10)
                .background(Color.init(hex: "f9f9f9"))
            , alignment: .center)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    NavigationBarView()
                    List(self.viewModel.realEstates) { realEstate in
                        ItemCellTypeTwo(realEstate: realEstate)
                    }
                    .background(Color.init(hex: "f9f9f9"))
                    .padding(.horizontal, -5)
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.fetchAllRealEstatesAll { (realEstates, error) in
                    if let realEstates = realEstates {
                        viewModel.realEstates = realEstates
                    } else if let error = error {
                        print("Error fetching real estates: \(error)")
                    }
                }
            }
        }
        .navigationBarHidden(true)
        
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyListView()
    }
}

struct ItemCellTypeTwo: View {
    
    let realEstate: RealEstate
    
    var body: some View {
        
        ZStack() {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(5)
                .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            
            HStack() {
//                Image(realEstate.imageURL)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 130, height: 170)
//                    .cornerRadius(5)
                AsyncImage(url: URL(string: realEstate.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 170)
                        .cornerRadius(5)
                    
                } placeholder: {
                    ProgressView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 170)
                        .cornerRadius(5)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                VStack(alignment: .leading) {
                    Text(realEstate.title)
                        .font(.headline)
                        .lineLimit(2)
                    Text(realEstate.location)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding([.top], 5)
                    HStack {
                        Text("LKR \(realEstate.price)")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .bold()
                            .padding(.top, 5)
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: realEstate.isFavorite == true ? "star.fill" : "star")
                                .foregroundColor(realEstate.isFavorite == true ? .red :.gray)
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                        }
                        .cornerRadius(20)
                        .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
                    }
                }
                .padding(.init(top: 10, leading: 5, bottom: 5, trailing: 0))
                Spacer()
            }
            .frame(height: 170)
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
