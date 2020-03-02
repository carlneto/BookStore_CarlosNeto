//
//  SearchInfo.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

struct SearchInfo: Codable {
    
    let textSnippet: String?
    
    enum CodingKeys: String, CodingKey {
        case textSnippet = "textSnippet"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        textSnippet = try values.decodeIfPresent(String.self, forKey: .textSnippet)
    }
}
