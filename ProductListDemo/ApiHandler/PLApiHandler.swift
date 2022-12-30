//
//  PLApiHandler.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import Foundation

enum PLApiError: LocalizedError{
    case invalidUrl
    case badResponce
}

class PLApiHandler: ObservableObject {
    
    @Published var productData: [ProductModel] = []
      
    func fetchAPiData() {
        fetchProducts { products, error in
            if let error = error{
                debugPrint(error.localizedDescription)
            }
            else{
                DispatchQueue.main.async {
                    self.productData = products
                }
            }
        }
    }
    
    func fetchProducts(complition: @escaping ([ProductModel], Error?) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328") else {
            complition([], PLApiError.invalidUrl)
            return
        }
        URLSession.shared.dataTask(with: url) { response, res, error in
            if let error = error{
                complition([], error)
                print(error.localizedDescription)
            }
            else if let data = response{
                do {
                    let json: NSDictionary? = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                    let products: [[String:Any]] = json?.value(forKey: "products") as? [[String:Any]] ?? [[:]]
                    let productList = products.map({ ProductModel($0) })
                    complition(productList, nil)
                } catch{
                    complition([], error)
                    debugPrint(error.localizedDescription)
                }
            }
            else{
                complition([], PLApiError.badResponce)
                return
            }
        }
        .resume()
    }
}
