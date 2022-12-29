//
//  PLProductCellView.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PLProductCellView: View {
    let action:() -> Void
    let actionCart:() -> Void
    let actionFav:() -> Void
    let model:ProductModel?
    let isFav: Bool
    @State var refresh: Bool = false

    var body: some View {
        Button(action: action) {
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
                            }
                            .padding(.leading)
                        }
                        Spacer()
                        HStack{
                            VStack(alignment:.trailing) {
                                Button(action: actionCart) {
                                    VStack(alignment:.leading) {
                                        Text(model?.addToCartButtonText ?? "")
                                            .font(.system(size: 16,weight: .semibold))
                                            .foregroundColor(.blue)
                                    }
                                }
                                Button(action: actionFav) {
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
        }
    }
}

struct PLProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        PLProductCellView(action: {},
                          actionCart: {},
                          actionFav: {},
                          model: dummyProductData,
                          isFav: false
        )
    }
}
