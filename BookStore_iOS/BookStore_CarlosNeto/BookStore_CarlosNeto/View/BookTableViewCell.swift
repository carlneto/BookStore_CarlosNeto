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
    
    private let addToFavorite = UIImage(named: "addToFavorite")
    private let addedFavorite = UIImage(named: "addedFavorite")
    
    private var item: Item?
    
    func setupUI(model: Item?) {
        item = model
        setFavorite(isFavorite: item?.isFavorite ?? false)
        let title = item?.volumeInfo?.title
        let listPrice = item?.saleInfo?.listPrice
        var price: String? = nil
        if let amount = listPrice?.amount, let value = listPrice?.currencyCode {
            price = listPrice != nil ? String(format: "%0.2f %@", amount, value) : "---"
        }
        favBtn.setImage(addToFavorite, for: .normal)
        favBtn.setImage(addedFavorite, for: .selected)
        if let identifier = item?.identifier {
            favBtn.accessibilityIdentifier = "\(identifier)_master"
        } else {
            favBtn.accessibilityIdentifier = nil
        }
        titleLbl.text = title
        priceLbl.text = price
    }
    
    @IBAction private func favBtnAction() {
        setFavorite(isFavorite: !(item?.isFavorite ?? false))
    }

    private func setFavorite(isFavorite: Bool) {
        item?.isFavorite = isFavorite
        favBtn.isSelected = isFavorite
        if let identifier = item?.identifier,
            let btn = UIButton.firstWith(identifier: "\(identifier)_detail") {
            btn.isSelected = isFavorite
        }
    }
}
