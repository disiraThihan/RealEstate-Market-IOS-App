//
//  Item.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//


import SwiftUI

struct ItemDetailsView: View {
    
    @State var index = 0
    @Binding var show : Bool
    
    var arrImage = ["house1", "house2", "house3", "house4"]
    let realEstate: RealEstate
    @ObservedObject var viewModel = RealEstateViewModel()
    
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    fileprivate func NavigationBarView() -> some View {
        return HStack(alignment: .center) {
            Button(action: {
//                self.presentationMode.wrappedValue.dismiss()
                self.show.toggle()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Constants.AppColor.secondaryBlack)
            }
            .padding(.leading, 10)
            .frame(width: 40, height: 40)
            Spacer()
            FavoriteButton()
                .padding(.trailing, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 35)
        .overlay(
            Text(self.realEstate.title)
                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                .foregroundColor(Constants.AppColor.primaryBlack)
                .padding(.horizontal, 10)
            , alignment: .center)
    }
    
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            
        }) {
            Image(systemName: self.realEstate.isFavorite == true ? "star.fill" : "star")
                .foregroundColor(self.realEstate.isFavorite == true ? .red : Constants.AppColor.secondaryBlack)
                .frame(width: 35, height: 35)
        }
        .cornerRadius(20)
    }
    
    fileprivate func ImageSlider() -> some View {
        return AsyncImage(url: URL(string: realEstate.imageURL)) { image in
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            ProgressView()
                .scaledToFill()
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .aspectRatio(4/2, contentMode: .fit)
    }
    
    fileprivate func SimilarProperties() -> some View {
        return VStack(alignment: .leading) {
            HStack {
                Text("Similar Properties")
                    .font(.custom(Constants.AppFont.boldFont, size: 15))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding(.leading, 15)
                
                Spacer(minLength: 10)
                
                Button(action: {
                    
                }) {
                    Text("See All")
                        .padding(.trailing, 15)
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 12))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                }
            }
            .padding(.top, 8)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 10) {
                    ForEach(self.viewModel.realEstates) { realEstate in
                        ItemRow(realEstate: realEstate)
                    }
                }.padding(.leading, 15)
            })
        }.background(Color.white)
    }
    
//    fileprivate func ContactAgentButton() -> some View {
//        Button(action: {
//            
//        }) {
//            Text("")
//                .frame(height: 65)
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .background(Constants.AppColor.gradientRedHorizontal)
//                .cornerRadius(0)
//        }
//        .padding(.horizontal, 0)
//        .overlay(
//            Text("See On Map")
//                .font(.custom(Constants.AppFont.boldFont, size: 15))
//                .foregroundColor(.white)
//                .padding(.top, -10)
//        )
//    }
    
    struct ContactAgentButton: View {
        var realEstateDescription: String
        
        var body: some View {
            NavigationLink(destination: MapView(initialSearchText: realEstateDescription)) {
                Text("")
                    .frame(height: 65)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Constants.AppColor.gradientRedHorizontal)
                    .cornerRadius(0)
                    .overlay(
                        Text("See On Map")
                            .font(.custom(Constants.AppFont.boldFont, size: 15))
                            .foregroundColor(.white)
                            .padding(.top, -10)
                    )
            }
            .padding(.horizontal, 0)
        }
    }

    
    var body: some View {
        VStack {
            NavigationBarView()
            ScrollView {
                ZStack {
                    Constants.AppColor.lightGrayColor
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        ImageSlider()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(self.realEstate.location)
                                    .font(.custom(Constants.AppFont.semiBoldFont, size: 18))
                                    .foregroundColor(Constants.AppColor.secondaryBlack)
                                Spacer(minLength: 10)
                                HStack(alignment: .center, spacing: 5) {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .padding(.leading, 6)
                                    
                                    Text("\(realEstate.rating).0")
                                        .font(.custom(Constants.AppFont.regularFont, size: 12))
                                        .foregroundColor(.white)
                                        .padding(.trailing, 6)
                                }.frame(height: 20)
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                            .padding([.horizontal], 15)
                            .padding(.top, 8)
                            
                            Text(realEstate.title)
                                .font(.custom(Constants.AppFont.lightFont, size: 13))
                                .foregroundColor(Constants.AppColor.secondaryBlack)
                                .lineLimit(nil)
                                .padding([.horizontal], 15)
                                .padding(.top, -5)
                                .padding(.bottom, 5)
                            
                            HStack {
                                Text("LKR \(realEstate.price)")
                                    .font(.custom(Constants.AppFont.boldFont, size: 14))
                                    .foregroundColor(Constants.AppColor.secondaryBlack)
                                Text(realEstate.type == "new" ? "" : "\(realEstate.yearBuilt) Built")
                                    .font(.custom(Constants.AppFont.regularFont, size: 13))
                                    .foregroundColor(Constants.AppColor.secondaryRed)
                                Spacer()
                            }
                            .padding(.bottom, 8)
                            .padding(.horizontal, 15)
                        }
                        .background(Color.white)
                        .padding(.bottom, 5)
                        
                        VStack(alignment: .leading) {
                            Text("Property Details")
                                .font(.custom(Constants.AppFont.semiBoldFont, size: 15))
                                .foregroundColor(.blue)
                                .padding(.top, 10)
                                .padding(.horizontal, 15)
                            Text(realEstate.description)
                                .font(.custom(Constants.AppFont.lightFont, size: 13))
                                .foregroundColor(Constants.AppColor.secondaryBlack)
                                .padding(.vertical, 8)
                                .lineSpacing(2)
                                .padding(.horizontal, 15)
                                .lineLimit(nil)
                            
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
                           
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.white)
                        .padding(.top, -3)
                        
                        SimilarProperties()
                            .padding(.init(top: 5, leading: 0, bottom: 10, trailing: 0))
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
                ContactAgentButton(realEstateDescription: realEstate.location) 
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.white)
            }
            
        }.edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(show: .constant(false), realEstate: RealEstate(id:"", idUser: "",title: "Modern Family Home", description: "A beautiful family home located in the suburbs with a large backyard and modern amenities.", imageURL: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", price: 450000, location: "Suburbs", rating: 4, type: "sale", isFavorite: false, size: 2500, bedrooms: 4, bathrooms: 3, yearBuilt: 2015))
    }
}

