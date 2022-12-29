//
//  PLProductListView.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import SwiftUI

struct PLProductListView: View {
    @EnvironmentObject var dataStore : DataStore
    @EnvironmentObject var apidata : PLApiHandler
    @State var moveToDescription:Bool = false
    @State var model: ProductModel?
    
    //    private let awardColumns =
    //      [GridItem(.flexible(),spacing: 10),
    //      GridItem(.flexible(),spacing: 10),]
    
    var body: some View {
        ZStack{
            NavigationLink("", isActive: $moveToDescription) {
                PLProductDetailView(model: model, isFav: dataStore.favId.contains(model?.id ?? ""))
            }
        
            
            List {
                ForEach(apidata.productData, id: \.id) { values in
                    let isFav = dataStore.favId.contains(values.id ?? "")
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
                    }, model: values, isFav: isFav)
                }
                .padding(.horizontal,5)
            }
            .onAppear {
                apidata.fetchAPiData()
            }
        }
        
        
    }
    
}

struct PLProductListView_Previews: PreviewProvider {
    static var previews: some View {
        PLProductListView()
            .environmentObject(PLApiHandler())
            .environmentObject(DataStore())
    }
}
