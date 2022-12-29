//
//  PLHomeView.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import SwiftUI

struct PLHomeView: View {
    @StateObject var apidata = PLApiHandler()
    @StateObject var dataStore = DataStore()
    var body: some View {
        NavigationView {
            VStack(alignment:.center) {
                NavigationLink(destination: PLProductListView()) {
                    CustomButtonWithStroke(name: "Product List", backGroundcolor: .black, foreGroundcolor: .white)
                        .padding(.bottom,11)
                }
                NavigationLink(destination: PLFavoriteListView()) {
                    CustomButtonWithStroke(name: "Favourite List",backGroundcolor: .white, foreGroundcolor: .black)
                }
                Spacer()
            }
            .padding()
        }
        .environmentObject(apidata)
        .environmentObject(dataStore)
    }
}

struct PLHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PLHomeView()
    }
}
