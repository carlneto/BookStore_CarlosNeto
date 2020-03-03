//
//  ListPrice.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct ListPrice: Codable {
    
    let amount: Double?
    let currencyCode: String?

    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case currencyCode = "currencyCode"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amount = try values.decodeIfPresent(Double.self, forKey: .amount)
        currencyCode = try values.decodeIfPresent(String.self, forKey: .currencyCode)
    }
}
