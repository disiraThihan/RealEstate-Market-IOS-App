//
//  Home.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    var arrImage = ["RE01", "RE02", "RE03", "RE01"]
    @ObservedObject var viewModel = RealEstateViewModel()
    @State private var selection: Int? = nil
    @State var show = false
    @State private var navigateToPropertyList: Bool = false
    
    fileprivate func NavigationBarView() -> some View {
        return HStack {
            Spacer()
            Button(action: {
                self.show.toggle()
                print("Tapped on notification")
            }) {
                Image(systemName: "bell")
            }
            .frame(height: 30)
            .foregroundColor(Constants.AppColor.secondaryBlack)
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text("Welcome to RealEstate Market!..")
                .font(.custom(Constants.AppFont.extraBoldFont, size: 15))
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    fileprivate func ImageSlider() -> some View {
        return PagingView(index: $index.animation(), maxIndex: self.arrImage.count - 1) {
            ForEach(self.arrImage, id: \.self) { image in
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 210)
            }
        }
        .aspectRatio(contentMode: .fill)
        .frame(width: UIScreen.main.bounds.width, height: 210)
    }
    
    fileprivate func SaleView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Most Valuable Lands")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.bottom, -1)
                    Text("With Best ROI")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    self.navigateToPropertyList = true
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                        .padding(.trailing, 15)
                }
                .background(
                    NavigationLink(
                        destination: PropertyListView(),
                        isActive: $navigateToPropertyList,
                        label: {
                            EmptyView()
                        }
                    )
                )
            }
            ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(self.viewModel.realEstates.filter { $0.type == "Land" }, id: \.id) { realEstate in
                                    ItemRow(realEstate: realEstate)
                                }
                            }
                            .padding(.leading, 10)
            }
        }.padding(.top, 10)
    }
    
    fileprivate func TrendingView() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Houses")
                        .font(.custom(Constants.AppFont.boldFont, size: 18))
                        .foregroundColor(Constants.AppColor.secondaryBlack)
                        .padding(.bottom, -1)
                    Text("Discover the latest properties")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 15)
                Spacer()
                Button(action: {
                    self.navigateToPropertyList = true
                }) {
                    Text("VIEW ALL")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                        .padding(.trailing, 15)
                }
                .background(
                    NavigationLink(
                        destination: PropertyListView(),
                        isActive: $navigateToPropertyList,
                        label: {
                            EmptyView()
                        }
                    )
                )
            }
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 5) {
                    ForEach(self.viewModel.realEstates.filter { $0.type == "House" }, id: \.id) { realEstate in
                        ItemRow(realEstate: realEstate)
                    }
//                    ForEach(self.viewModel.realEstates.filter { $0.type == "new" }, id: \.id) { realEstate in
//                        ItemRow(realEstate: realEstate)
//                    }
                }
                .padding(.leading, 10)
            })
        }.padding(.top, 10)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    NavigationBarView()
                    ScrollView {
                        VStack {
                            ImageSlider()
                            SaleView()
                            TrendingView()
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
