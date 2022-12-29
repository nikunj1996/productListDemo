//
//  PLApiHandler.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import Foundation

class PLApiHandler: ObservableObject {
    
    @Published var productData: [ProductModel] = []
      
    func fetchAPiData() {
        guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328") else { return }
        
        URLSession.shared.dataTask(with: url) { response, res, error in
            if let error = error{
                print(error.localizedDescription)
            }
            else {
                guard let data = response else { return }
                var json : NSDictionary?
                do {
                    json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                } catch{
                    debugPrint(error.localizedDescription)
                }
                if let products : [[String:Any]] = json?.value(forKey: "products") as? [[String:Any]] {
                    DispatchQueue.main.async {
                        self.productData = products.map({ value in
                            return ProductModel.init(value)
                        })
                    }
                }
            }
        }.resume()
    }
    
}
