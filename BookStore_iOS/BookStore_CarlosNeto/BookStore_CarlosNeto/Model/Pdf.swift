//
//  Pdf.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct Pdf: Codable {
    
    let isAvailable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isAvailable = "isAvailable"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isAvailable = try values.decodeIfPresent(Bool.self, forKey: .isAvailable)
    }
}
