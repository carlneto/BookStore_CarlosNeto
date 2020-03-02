//
//  ImageLinks.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct ImageLinks: Codable {
    
    let smallThumbnail: String?
    let thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case smallThumbnail = "smallThumbnail"
        case thumbnail = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        smallThumbnail = try values.decodeIfPresent(String.self, forKey: .smallThumbnail)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
    }
}
