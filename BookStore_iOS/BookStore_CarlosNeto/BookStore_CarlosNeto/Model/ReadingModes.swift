//
//  ReadingModes.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct ReadingModes: Codable {
    
    let text: Bool?
    let image: Bool?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(Bool.self, forKey: .text)
        image = try values.decodeIfPresent(Bool.self, forKey: .image)
    }
}
