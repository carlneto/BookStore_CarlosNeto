//
//  DetailViewController.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var favBtn: UIButton!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var authorLbl: UILabel!
    @IBOutlet private weak var infoLbl: UILabel!
    @IBOutlet private weak var linkBtn: UIButton!
    @IBOutlet private weak var favView: UIView!
    @IBOutlet private weak var titleTag: UILabel!
    @IBOutlet private weak var authorTag: UILabel!
    @IBOutlet private weak var infoTag: UILabel!
    @IBOutlet private weak var linkView: UIView!
    
    private var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Book Item"
        if item == nil, let nav = splitViewController?.viewControllers.last as? UINavigationController {
            nav.popViewController(animated: true)
        }
        titleLbl.text = ""
        authorLbl.text = ""
        infoLbl.text = ""
        linkBtn.setTitle("", for: .normal)
        linkBtn.contentHorizontalAlignment = .right
        setTags()
    }
    
    func setupUI(item: Item?) {
        self.item = item
        setFavorite(isFavorite: self.item?.isFavorite ?? false)
        let addToFavorite = UIImage(named: "addToFavorite")
        let addedFavorite = UIImage(named: "addedFavorite")
        favBtn.setImage(addToFavorite, for: .normal)
        favBtn.setImage(addedFavorite, for: .selected)
        if let identifier = self.item?.identifier {
            favBtn.accessibilityIdentifier = "\(identifier)_detail"
        } else {
            favBtn.accessibilityIdentifier = nil
        }
        titleLbl.text = item?.volumeInfo?.title
        authorLbl.text = item?.volumeInfo?.authors?.first
        infoLbl.text = item?.volumeInfo?.description
        linkBtn.setTitle(item?.volumeInfo?.infoLink, for: .normal)
        
        setTags()
    }
    
    private func setTags() {
        titleTag.isHidden = titleLbl.text?.isEmpty ?? true
        authorTag.isHidden = authorLbl.text?.isEmpty ?? true
        infoTag.isHidden = infoLbl.text?.isEmpty ?? true
    }

    @IBAction private func favBtnAction(_ sender: UIButton) {
        setFavorite(isFavorite: !(item?.isFavorite ?? true))
    }

    @IBAction private func linkBtnAction(_ sender: UIButton) {
        guard let url = URL(string: linkBtn.titleLabel?.text ?? ""), !url.absoluteString.isEmpty else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: { success in
            print("Open \(url.absoluteString): \(success)")
        })
    }
    
    private func setFavorite(isFavorite: Bool) {
        item?.isFavorite = isFavorite
        favBtn.isSelected = isFavorite
        if let identifier = item?.identifier,
            let btn = UIButton.firstWith(identifier: "\(identifier)_master") {
            btn.isSelected = isFavorite
        }
    }
}
