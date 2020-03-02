//
//  BookVolumes.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct BookVolumes: Codable {
    
    let kind: String?
    let totalItems: Int?
    var items: Items?
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case totalItems = "totalItems"
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        totalItems = try values.decodeIfPresent(Int.self, forKey: .totalItems)
        items = try values.decodeIfPresent(Items.self, forKey: .items)
    }
}
