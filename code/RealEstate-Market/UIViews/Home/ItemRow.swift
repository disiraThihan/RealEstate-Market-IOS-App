//
//  ItemRow.swift
//  RealEstate-Market
//
//  Created by Disira Thihan on 2024-06-05.
//

import SwiftUI

struct ItemRow: View {
    
    var realEstate: RealEstate
    @State var show = false
    
    fileprivate func TopLabel() -> some View {
        return Text(realEstate.type == "new" ? "New" : "-20%")
            .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
            .padding([.trailing, .leading], 8)
            .frame(height: 25)
            .background(realEstate.type == "new" ? Constants.AppColor.primaryBlack : Color.init(hex: "DB3022"))
            .cornerRadius(12.5)
            .foregroundColor(.white)
    }
    
    fileprivate func FavoriteButton() -> some View {
        return Button(action: {
            print("Title: \(self.realEstate.title)")
        }) {
            Image(systemName: realEstate.isFavorite == true ? "star.fill" : "star")
                .foregroundColor(realEstate.isFavorite == true ? .red :.gray)
                .frame(width: 30, height: 30)
                .background(Color.white)
        }
        .cornerRadius(20)
        .opacity(0.9)
        .shadow(color: Color.init(hex: "dddddd"), radius: 0.5, x: 0.3, y: 0.3)
    }
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ItemDetailsView(show: self.$show, realEstate: realEstate), isActive: self.$show) {
                Text("")
            }
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: realEstate.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 190)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .cornerRadius(5)
                        .overlay(
                            FavoriteButton()
                                .padding([.top, .trailing], 5)
                            , alignment: .topTrailing
                        )
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 190)
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                Text(realEstate.location)
                    .font(.custom(Constants.AppFont.semiBoldFont, size: 14))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding([.horizontal], 5)
                Text(realEstate.title)
                    .font(.custom(Constants.AppFont.regularFont, size: 11))
                    .foregroundColor(Constants.AppColor.secondaryBlack)
                    .padding([.horizontal], 5)
                HStack {
                    Text("LKR \(realEstate.price)")
                        .font(.custom(Constants.AppFont.semiBoldFont, size: 13))
                        .foregroundColor(Constants.AppColor.primaryBlack)
                    Text(realEstate.type == "new" ? "" : "\(realEstate.yearBuilt) Built")
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(Constants.AppColor.secondaryRed)
                }
                .padding([.leading, .trailing], 5)
                Spacer()
            }
            .frame(width: 170, height: 255)
            .background(Color.clear)
            .clipped()
            .onTapGesture {
                self.show.toggle()
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(realEstate: RealEstate(id:"", idUser: "",title: "Modern Family Home", description: "A beautiful family home located in the suburbs with a large backyard and modern amenities.", imageURL: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", price: 450000, location: "Suburbs", rating: 4, type: "sale", isFavorite: false, size: 2500, bedrooms: 4, bathrooms: 3, yearBuilt: 2015))
    }
}
