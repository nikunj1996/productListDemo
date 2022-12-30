//
//  DataStore.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import Foundation

class DataStore: ObservableObject{
    @Published var favId : [String] = []
    
    func onFavClick(id: String){
        if let index = favId.firstIndex(of: id){
            favId.remove(at: index)
        }
        else{
            favId.append(id)
        }
    }
}
