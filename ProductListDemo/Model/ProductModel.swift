//
//  ProductModel.swift
//  ProductListDemo
//
//  Created by Nikunj Ladani on 29/12/22.
//

import Foundation

class ProductModel: NSObject, Codable, NSCopying, NSCoding
{
    enum Keys: String {
        case citrusId
        case title
        case id
        case imageURL
        case price
        case brand
        case badges
        case ratingCount
        case messages
        case isAddToCartEnable
        case addToCartButtonText
        case isInTrolley
        case isInWishlist
        case purchaseTypes
        case isFindMeEnable
        case saleUnitPrice
        case totalReviewCount
        case isDeliveryOnly
        case isDirectFromSupplier
    }

    var citrusId:String?
    var title: String?
    var id: String?
    var imageURL:String?
    var brand: String?
    var ratingCount: String?
    var addToCartButtonText: String?
    var saleUnitPrice: String?
    var totalReviewCount: String?
    
    var isAddToCartEnable: Bool
    var isInTrolley: Bool
    var isInWishlist: Bool
    var isFindMeEnable: Bool
    var isDeliveryOnly: Bool
    var isDirectFromSupplier: Bool
    
    var badges: [String]?

    var price: [PriceModel]?
    var purchaseTypes: [PurchaseTypesModel]?
    var messages: MessagesModel?

    init(_ dict:[String:Any]) {
        citrusId = checkForString(dict, key: Keys.citrusId.rawValue)
        title = checkForString(dict, key: Keys.title.rawValue)
        id = checkForString(dict, key: Keys.id.rawValue)
        imageURL = checkForString(dict, key: Keys.imageURL.rawValue)
        brand = checkForString(dict, key: Keys.brand.rawValue)
        ratingCount = checkForString(dict, key: Keys.ratingCount.rawValue)
        addToCartButtonText = checkForString(dict, key: Keys.addToCartButtonText.rawValue)
        saleUnitPrice = checkForString(dict, key: Keys.saleUnitPrice.rawValue)
        totalReviewCount = checkForString(dict, key: Keys.totalReviewCount.rawValue)

        isAddToCartEnable = dict[Keys.isAddToCartEnable.rawValue] as? Bool ?? false
        isInTrolley = dict[Keys.isInTrolley.rawValue] as? Bool ?? false
        isInWishlist = dict[Keys.isInWishlist.rawValue] as? Bool ?? false
        isFindMeEnable = dict[Keys.isFindMeEnable.rawValue] as? Bool ?? false
        isDeliveryOnly = dict[Keys.isDeliveryOnly.rawValue] as? Bool ?? false
        isDirectFromSupplier = dict[Keys.isDirectFromSupplier.rawValue] as? Bool ?? false

        badges = dict[Keys.badges.rawValue] as? [String] ?? [""]

        if let arr = dict[Keys.price.rawValue] as? [[String:Any]] {
            self.price = arr.map({ PriceModel($0) })
        }
        if let arr = dict[Keys.purchaseTypes.rawValue] as? [[String:Any]] {
            self.purchaseTypes = arr.map({ PurchaseTypesModel($0) })
        }
        if let dic = dict[Keys.messages.rawValue] as? [String:Any] {
            self.messages = MessagesModel.init(dic)
        }
    }
    
    required init?(coder: NSCoder) {
        self.citrusId = coder.decodeObject(forKey: Keys.citrusId.rawValue) as? String
        self.title = coder.decodeObject(forKey: Keys.title.rawValue) as? String
        self.id = coder.decodeObject(forKey: Keys.id.rawValue) as? String
        self.imageURL = coder.decodeObject(forKey: Keys.imageURL.rawValue) as? String
        self.price = coder.decodeObject(forKey: Keys.price.rawValue) as? [PriceModel]
        self.brand = coder.decodeObject(forKey: Keys.brand.rawValue) as? String
        self.badges = coder.decodeObject(forKey: Keys.badges.rawValue) as? [String]
        self.ratingCount = coder.decodeObject(forKey: Keys.ratingCount.rawValue) as? String
        self.messages = coder.decodeObject(forKey: Keys.messages.rawValue) as? MessagesModel
        self.isAddToCartEnable = coder.decodeBool(forKey: Keys.isAddToCartEnable.rawValue)
        self.addToCartButtonText = coder.decodeObject(forKey: Keys.addToCartButtonText.rawValue) as? String
        self.isInTrolley = coder.decodeBool(forKey: Keys.isInTrolley.rawValue)
        self.isInWishlist = coder.decodeBool(forKey: Keys.isInWishlist.rawValue)
        self.purchaseTypes = coder.decodeObject(forKey: Keys.purchaseTypes.rawValue) as? [PurchaseTypesModel]
        self.isFindMeEnable = coder.decodeBool(forKey: Keys.isFindMeEnable.rawValue)
        self.saleUnitPrice = coder.decodeObject(forKey: Keys.saleUnitPrice.rawValue) as? String
        self.totalReviewCount = coder.decodeObject(forKey: Keys.totalReviewCount.rawValue) as? String
        self.isDeliveryOnly = coder.decodeBool(forKey: Keys.isDeliveryOnly.rawValue)
        self.isDirectFromSupplier = coder.decodeBool(forKey: Keys.isDirectFromSupplier.rawValue)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = ProductModel([:])
        copy.citrusId = self.citrusId
        copy.title = self.title
        copy.id = self.id
        copy.imageURL = self.imageURL
        copy.price = self.price
        copy.brand = self.brand
        copy.badges = self.badges
        copy.ratingCount = self.ratingCount
        copy.messages = self.messages
        copy.isAddToCartEnable = self.isAddToCartEnable
        copy.addToCartButtonText = self.addToCartButtonText
        copy.isInTrolley = self.isInTrolley
        copy.isInWishlist = self.isInWishlist
        copy.purchaseTypes = self.purchaseTypes
        copy.isFindMeEnable = self.isFindMeEnable
        copy.saleUnitPrice = self.saleUnitPrice
        copy.totalReviewCount = self.totalReviewCount
        copy.isDeliveryOnly = self.isDeliveryOnly
        copy.isDirectFromSupplier = self.isDirectFromSupplier
        return copy
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.citrusId, forKey: Keys.citrusId.rawValue)
        coder.encode(self.title, forKey: Keys.title.rawValue)
        coder.encode(self.id, forKey: Keys.id.rawValue)
        coder.encode(self.imageURL, forKey: Keys.imageURL.rawValue)
        coder.encode(self.price, forKey: Keys.price.rawValue)
        coder.encode(self.brand, forKey: Keys.brand.rawValue)
        coder.encode(self.badges, forKey: Keys.badges.rawValue)
        coder.encode(self.ratingCount, forKey: Keys.ratingCount.rawValue)
        coder.encode(self.messages, forKey: Keys.messages.rawValue)
        coder.encode(self.isAddToCartEnable, forKey: Keys.isAddToCartEnable.rawValue)
        coder.encode(self.addToCartButtonText, forKey: Keys.addToCartButtonText.rawValue)
        coder.encode(self.isInTrolley, forKey: Keys.isInTrolley.rawValue)
        coder.encode(self.isInWishlist, forKey: Keys.isInWishlist.rawValue)
        coder.encode(self.purchaseTypes, forKey: Keys.purchaseTypes.rawValue)
        coder.encode(self.isFindMeEnable, forKey: Keys.isFindMeEnable.rawValue)
        coder.encode(self.saleUnitPrice, forKey: Keys.saleUnitPrice.rawValue)
        coder.encode(self.totalReviewCount, forKey: Keys.totalReviewCount.rawValue)
        coder.encode(self.isDeliveryOnly, forKey: Keys.isDeliveryOnly.rawValue)
        coder.encode(self.isDirectFromSupplier, forKey: Keys.isDirectFromSupplier.rawValue)
    }
}

class PriceModel: NSObject, Codable, NSCopying, NSCoding {

    enum Keys: String {
        case message
        case value
        case isOfferPrice
    }

    var message: String?
    var value: String?
    var isOfferPrice: Bool
    
    init(_ dict:[String:Any]) {
        message = checkForString(dict, key: Keys.message.rawValue)
        value = checkForString(dict, key: Keys.value.rawValue)
        isOfferPrice = dict[Keys.isOfferPrice.rawValue] as? Bool ?? false
    }
    
    required init?(coder: NSCoder) {
        self.message = coder.decodeObject(forKey: Keys.message.rawValue) as? String
        self.value = coder.decodeObject(forKey: Keys.value.rawValue) as? String
        self.isOfferPrice = coder.decodeBool(forKey: Keys.isOfferPrice.rawValue)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = PriceModel([:])
        copy.message = self.message
        copy.value = self.value
        copy.isOfferPrice = self.isOfferPrice
        return copy
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.message, forKey: Keys.message.rawValue)
        coder.encode(self.value, forKey: Keys.value.rawValue)
        coder.encode(self.isOfferPrice, forKey: Keys.isOfferPrice.rawValue)
    }

}

class MessagesModel: NSObject, Codable, NSCopying, NSCoding {

    enum Keys: String {
        case promotionalMessage
        case secondaryMessage
        case sash
    }

    var promotionalMessage: String?
    var secondaryMessage: String?
    var sash: String?
    
    init(_ dict:[String:Any]) {
        promotionalMessage = checkForString(dict, key: Keys.promotionalMessage.rawValue)
        secondaryMessage = checkForString(dict, key: Keys.secondaryMessage.rawValue)
        sash = checkForString(dict, key: Keys.sash.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.promotionalMessage = coder.decodeObject(forKey: Keys.promotionalMessage.rawValue) as? String
        self.secondaryMessage = coder.decodeObject(forKey: Keys.secondaryMessage.rawValue) as? String
        self.sash = coder.decodeObject(forKey: Keys.sash.rawValue) as? String
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = MessagesModel([:])
        copy.promotionalMessage = self.promotionalMessage
        copy.secondaryMessage = self.secondaryMessage
        copy.sash = self.sash
        return copy
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.promotionalMessage, forKey: Keys.promotionalMessage.rawValue)
        coder.encode(self.secondaryMessage, forKey: Keys.secondaryMessage.rawValue)
        coder.encode(self.sash, forKey: Keys.sash.rawValue)
    }

}

class PurchaseTypesModel: NSObject, Codable, NSCopying, NSCoding {

    enum Keys: String {
        case purchaseType
        case displayName
        case unitPrice
        case minQtyLimit
        case maxQtyLimit
        case cartQty
    }

    var purchaseType: String?
    var displayName: String?
    var unitPrice: String?
    var minQtyLimit: String?
    var maxQtyLimit: String?
    var cartQty: String?

    init(_ dict:[String:Any]) {
        purchaseType = checkForString(dict, key: Keys.purchaseType.rawValue)
        displayName = checkForString(dict, key: Keys.displayName.rawValue)
        unitPrice = checkForString(dict, key: Keys.unitPrice.rawValue)
        minQtyLimit = checkForString(dict, key: Keys.minQtyLimit.rawValue)
        maxQtyLimit = checkForString(dict, key: Keys.maxQtyLimit.rawValue)
        cartQty = checkForString(dict, key: Keys.cartQty.rawValue)
    }
    
    required init?(coder: NSCoder) {
        self.purchaseType = coder.decodeObject(forKey: Keys.purchaseType.rawValue) as? String
        self.displayName = coder.decodeObject(forKey: Keys.displayName.rawValue) as? String
        self.unitPrice = coder.decodeObject(forKey: Keys.unitPrice.rawValue) as? String
        self.minQtyLimit = coder.decodeObject(forKey: Keys.minQtyLimit.rawValue) as? String
        self.maxQtyLimit = coder.decodeObject(forKey: Keys.maxQtyLimit.rawValue) as? String
        self.cartQty = coder.decodeObject(forKey: Keys.cartQty.rawValue) as? String
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = PurchaseTypesModel([:])
        copy.purchaseType = self.purchaseType
        copy.displayName = self.displayName
        copy.unitPrice = self.unitPrice
        copy.minQtyLimit = self.minQtyLimit
        copy.maxQtyLimit = self.maxQtyLimit
        copy.cartQty = self.cartQty
        return copy
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.purchaseType, forKey: Keys.purchaseType.rawValue)
        coder.encode(self.displayName, forKey: Keys.displayName.rawValue)
        coder.encode(self.unitPrice, forKey: Keys.unitPrice.rawValue)
        coder.encode(self.minQtyLimit, forKey: Keys.minQtyLimit.rawValue)
        coder.encode(self.maxQtyLimit, forKey: Keys.maxQtyLimit.rawValue)
        coder.encode(self.cartQty, forKey: Keys.cartQty.rawValue)
    }

}

func checkForString(_ dict : [String:Any], key : String) -> String
{
    if let st : String = dict[key] as? String
    {
        return st
    }
    else if let int : Int = dict[key] as? Int
    {
        return "\(int)"
    }
    else if let dbl : Double = dict[key] as? Double
    {
        return dbl.removeZerosFromEnd()
    }
    else
    {
        return ""
    }
}
extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
