//
//  Item.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import Foundation

typealias Items = [Item]

struct Item: Codable {
    
    let kind: String?
    let identifier: String?
    let etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let accessInfo: AccessInfo?
    let searchInfo: SearchInfo?
    
    private let useDefaults = UserDefaults.standard
    private var _isFavorite = false
    
    var isFavorite: Bool {
        mutating get {
            guard let identifier = identifier else { return false }
            _isFavorite = useDefaults.bool(forKey: identifier)
            return _isFavorite
        }
        set {
            guard let identifier = identifier else { return }
            useDefaults.set(newValue, forKey: identifier)
            _isFavorite = newValue
        }
    }
        
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case identifier = "id"
        case etag = "etag"
        case selfLink = "selfLink"
        case volumeInfo = "volumeInfo"
        case saleInfo = "saleInfo"
        case accessInfo = "accessInfo"
        case searchInfo = "searchInfo"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        identifier = try values.decodeIfPresent(String.self, forKey: .identifier)
        etag = try values.decodeIfPresent(String.self, forKey: .etag)
        selfLink = try values.decodeIfPresent(String.self, forKey: .selfLink)
        volumeInfo = try values.decodeIfPresent(VolumeInfo.self, forKey: .volumeInfo)
        saleInfo = try values.decodeIfPresent(SaleInfo.self, forKey: .saleInfo)
        accessInfo = try values.decodeIfPresent(AccessInfo.self, forKey: .accessInfo)
        searchInfo = try values.decodeIfPresent(SearchInfo.self, forKey: .searchInfo)
    }
}
