//
//  BookTableViewCell.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var favBtn: UIButton!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var priceLbl: UILabel!
    
    private var item: Item?
    
    func setModel(_ model: Item?) {
        item = model
        let title = item?.volumeInfo?.title
        let listPrice = item?.saleInfo?.listPrice
        var price: String? = nil
        if let amount = listPrice?.amount, let value = listPrice?.currencyCode {
            price = listPrice != nil ? String(format: "%0.2f %@", amount, value) : "---"
        }
        setFavorite(item?.isFavorite)
        let addToFavorite = UIImage(named: "addToFavorite")
        let addedFavorite = UIImage(named: "addedFavorite")
        favBtn.setImage(addToFavorite, for: .normal)
        favBtn.setImage(addedFavorite, for: .selected)
        let favBtnIdentifier = "\(item?.identifier ?? "item_identifier")_master"
        favBtn.accessibilityIdentifier = favBtnIdentifier
        titleLbl.text = title
        priceLbl.text = price
    }
    
    @IBAction func favBtnAction() {
        setFavorite(item?.isFavorite)
    }

    func setFavorite(_ isFav: Bool?) {
        let isFavorite = isFav ?? false
        item?.isFavorite = isFavorite
        favBtn.isSelected = isFavorite
        let itemId = "\(item?.identifier ?? "")_detail"
        UIButton.with(identifier: itemId)?.isSelected = isFavorite
    }
}
