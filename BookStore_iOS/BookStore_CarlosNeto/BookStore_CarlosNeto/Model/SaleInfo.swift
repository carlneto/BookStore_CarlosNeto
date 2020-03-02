//
//  SaleInfo.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct SaleInfo: Codable {
    
    let country: String?
    let saleability: String?
    let isEbook: Bool?
    let listPrice: ListPrice?
    
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case saleability = "saleability"
        case isEbook = "isEbook"
        case listPrice = "listPrice"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        saleability = try values.decodeIfPresent(String.self, forKey: .saleability)
        isEbook = try values.decodeIfPresent(Bool.self, forKey: .isEbook)
        listPrice = try values.decodeIfPresent(ListPrice.self, forKey: .listPrice)
    }
}
