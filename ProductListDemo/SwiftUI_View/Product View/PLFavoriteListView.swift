//
//  PLFavoriteListView.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import SwiftUI

struct PLFavoriteListView: View {
    @EnvironmentObject var dataStore : DataStore
    @EnvironmentObject var apidata : PLApiHandler
    @State var moveToDescription:Bool = false
    @State var model: ProductModel?
    @State var favList: [ProductModel] = []
    
    private let awardColumns =
    [GridItem(.flexible(),spacing: 10),
     GridItem(.flexible(),spacing: 10),]
    
    var body: some View {
        List {
            ForEach(favList, id: \.id) { values in
                
                PLProductCellView(action: {
                    moveToDescription.toggle()
                    model = values
                }, actionCart: {
                    
                }, actionFav: {
                    if dataStore.favId.contains(values.id ?? "") {
                        dataStore.favId.removeAll { str in
                            return str == (values.id ?? "")
                        }
                    } else {
                        dataStore.favId.append(values.id ?? "")
                    }
                    filterData()
                }, model: values, isFav: dataStore.favId.contains(values.id ?? ""))
            }
            .padding(.horizontal,5)
        }
        .onAppear(perform: filterData)
        NavigationLink("", isActive: $moveToDescription) {
            PLProductDetailView(model: model, isFav: dataStore.favId.contains(model?.id ?? ""))
        }
        
    }
    
    func filterData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 , execute: {
            let products = apidata.productData.filter({ model in
                return dataStore.favId.contains(model.id ?? "")
            })
            favList = products
        })
    }
}

struct PLFavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        PLFavoriteListView()
            .environmentObject(PLApiHandler())
            .environmentObject(DataStore())
    }
}
