//
//  FavoritesView.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import SwiftUI
import PartialSheet

struct FavoriteView: View {
    
    @ObservedObject var viewModel = RealEstateViewModel()
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Spacer()
            .frame(height: 30)
            .foregroundColor(Constants.AppColor.secondaryBlack)
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Favorite")
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    var body: some View {
        return NavigationView {
            VStack {
                NavigationBarView()
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 10) {
                        ForEach(self.viewModel.realEstates, id: \.id) { realEstate in
                            FavoriteRowNew(realEstate: realEstate)
                        }
                    }
                })
                .padding(.init(top: 5, leading: 15, bottom: 0, trailing: 15))
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
        
    }
}

struct FavoriteRowNew: View {
    
    let realEstate: RealEstate
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            print("Title: \(self.realEstate.title)")
        }) {
            Image(systemName: "multiply")
                .foregroundColor(.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(15)
        .opacity(0.8)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                AsyncImage(url: URL(string: realEstate.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 100)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .cornerRadius(0)
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 100)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .cornerRadius(0)
                }
                
                VStack(alignment: .leading) {
                    Text(realEstate.location)
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 14))                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.horizontal, 5)
                    
                    Text(realEstate.title)
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.horizontal, 5)
                        .padding(.top, 1)
                    
                    HStack {
                        Text("LKR \(realEstate.price)")
                            .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                            .foregroundColor(Constants.AppColor.primaryBlack)
                        Text("Price is negotiable.")
                            .font(.custom(Constants.AppFont.regularFont, size: 11))
                            .foregroundColor(Constants.AppColor.secondaryRed)
                    }
                    .padding(.init(top: 1, leading: 5, bottom: 5, trailing: 5))
                }
                Spacer()
                VStack {
                    FavoriteButton()
                        .padding(.bottom, 5)
                }
                .padding(.horizontal, 5)
            }
            LineView()
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 100, alignment: .leading)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}


