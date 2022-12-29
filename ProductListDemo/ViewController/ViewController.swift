//
//  ViewController.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import UIKit
import SwiftUI

var dummyProductData : ProductModel?
//var favId : [String] = [String]()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setDummyData()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let swiftUIView = PLHomeView()
        let homeViewController = UIHostingController(rootView: swiftUIView)
        homeViewController.modalPresentationStyle = .overCurrentContext
        self.showDetailViewController(homeViewController, sender: self)
    }
    
    func setDummyData() {
        let dict: [String:Any] = [
            "citrusId": "display_1_F_Al-mgtjXrg-pn33UYREA0P0KCgoIRE1fMjMxMjQSABoMCP2us5YGEJrokdEDIgIIAQ==",
            "title": "Diamond Label Shiraz",
            "id": "23124",
            "imageURL": "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM",
            "brand": "Rosemount",
            "badges": [
                "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"
            ],
            "ratingCount": 4.0,
            "isAddToCartEnable": true,
            "addToCartButtonText": "Add to cart",
            "isInTrolley": false,
            "isInWishlist": false,
            "isFindMeEnable": false,
            "saleUnitPrice": 10.18,
            "totalReviewCount": 11,
            "isDeliveryOnly": false,
            "isDirectFromSupplier": false
        ]
        dummyProductData = ProductModel.init(dict)
    }
    
}

