//
//  PLProductDetailView.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PLProductDetailView: View {
    @EnvironmentObject var dataStore : DataStore
    let model:ProductModel?
    @State var isFav: Bool

    var body: some View {
        VStack {
            VStack{
                WebImage(url:URL(string:model?.imageURL ?? ""))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .padding(.top,0)
                HStack{
                    HStack{
                        VStack(alignment:.leading) {
                            Text(model?.title ?? "")
                                .font(.system(size: 16,weight: .semibold))
                            Text("Price: \(model?.saleUnitPrice ?? "")")
                                .font(.system(size: 14,weight: .medium))
                            Text("Rating: \(model?.ratingCount ?? "")")
                                .font(.system(size: 14,weight: .medium))
                        }
                        .padding(.leading)
                    }
                    Spacer()
                    HStack{
                        VStack(alignment:.trailing) {
                            VStack(alignment:.leading) {
                                Text(model?.addToCartButtonText ?? "")
                                    .font(.system(size: 16,weight: .semibold))
                                    .foregroundColor(.blue)
                            }
                            Button(action: {
                                updateFav()
                            }) {
                                VStack(alignment:.leading) {
                                    Image(isFav ? "fav" : "un_fav")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20, height: 20)
                                }
                            }

                        }
                        .padding(.trailing)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 240)
            .foregroundColor(.black)
//                .background(.white)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.white)
            )
        }
        .onDisappear {
            if isFav {
                if !dataStore.favId.contains(model?.id ?? "") {
                    dataStore.favId.append(model?.id ?? "")
                }
            } else {
                if dataStore.favId.contains(model?.id ?? "") {
                    dataStore.favId.removeAll { str in
                        return str == (model?.id ?? "")
                    }
                }
            }
        }
    }
    
    func updateFav() {
        isFav = !isFav
    }
}

struct PLProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PLProductDetailView(model: dummyProductData,
                            isFav: false)
        .environmentObject(DataStore())

    }
}
