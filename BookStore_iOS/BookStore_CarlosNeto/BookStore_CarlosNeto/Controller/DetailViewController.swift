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
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var authorView: UIView!
    @IBOutlet private weak var infoView: UIView!
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
        titleView.isHidden = true
        authorView.isHidden = true
        infoView.isHidden = true
        linkView.isHidden = true
        linkBtn.contentHorizontalAlignment = .right
    }
    
    func setupUI(_ item: Item?) {
        self.item = item

        setFavorite(self.item?.isFavorite ?? false)
        let addToFavorite = UIImage(named: "addToFavorite")
        let addedFavorite = UIImage(named: "addedFavorite")
        favBtn.setImage(addToFavorite, for: .normal)
        favBtn.setImage(addedFavorite, for: .selected)
        favBtn.accessibilityIdentifier = "\(self.item?.identifier ?? "")_detail"

        titleLbl.text = item?.volumeInfo?.title
        authorLbl.text = item?.volumeInfo?.authors?.first
        infoLbl.text = item?.volumeInfo?.description
        linkBtn.setTitle(item?.volumeInfo?.infoLink, for: .normal)

        titleView.isHidden = titleLbl.text?.isEmpty ?? true
        authorView.isHidden = authorLbl.text?.isEmpty ?? true
        infoView.isHidden = infoLbl.text?.isEmpty ?? true
        linkView.isHidden = linkBtn.titleLabel?.text?.isEmpty ?? true
    }
    
    func setFavorite(_ isFav: Bool) {
        item?.isFavorite = isFav
        favBtn.isSelected = isFav
        let identifier = "\(item?.identifier ?? "")_master"
        UIButton.with(identifier: identifier)?.isSelected = isFav
    }

    @IBAction func favBtnAction(_ sender: UIButton) {
        setFavorite(!(item?.isFavorite ?? true))
    }

    @IBAction func linkBtnAction(_ sender: UIButton) {
        let url = URL(string: linkBtn.titleLabel?.text ?? "")
        if let url = url {
            UIApplication.shared.openURL(url)
        }
    }
}
