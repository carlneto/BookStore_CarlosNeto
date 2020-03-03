//
//  ViewController.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    @IBOutlet private var volumesTableView: UITableView!
    @IBOutlet private weak var favSwitch: UISwitch!
    
    private var volumes: BookVolumes?
    private var selectedItem: Item?
    private var tableItems: Items?
    private var padding = 0
    private var startIndex = 0
    private var maxResults = 0 {
        didSet {
            padding = Int(4 * Double(maxResults) / 5)
        }
    }
    
    var detailVC: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books List"
        startIndex = 0
        maxResults = 20
        favSwitch.isOn = false
        getBookVolumes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if splitViewController?.isCollapsed ?? true {
            updateUI()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell,
            let item = tableItems?[safe: indexPath.row] else {
                return UITableViewCell()
        }
        cell.setupUI(model: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = detailVC else { return }
        detailVC.setupUI(item: tableItems?[safe: indexPath.row])
        if let splitVC = splitViewController, splitVC.isCollapsed {
            splitVC.showDetailViewController(detailVC, sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let count = tableItems?.count else { return }
        if indexPath.row == count - padding { getBookVolumes() }
    }
    
    private func getBookVolumes() {
        let urn = "https://www.googleapis.com/books/v1/volumes"
        let uri = "\(urn)?q=ios&maxResults=\(maxResults)&startIndex=\(startIndex)"
        guard !favSwitch.isOn, let jsonURL = URL(string: uri) else { return }
        weak var weekSelf = self
        jsonURL.asyncDownload { data, response, error in
            guard let data = data else { return }
            do {
                let jsonDecoder = JSONDecoder()
                let books = try jsonDecoder.decode(BookVolumes.self, from: data)
                guard let weekSelf = weekSelf else { return }
                weekSelf.setModel(bookVolumes: books)
                weekSelf.startIndex += weekSelf.maxResults
            } catch {
                print("JSONSerialization error:", error)
            }
        }
    }
    
    private func setModel(bookVolumes: BookVolumes?) {
        let isVolumesNil = volumes == nil
        for var item in bookVolumes?.items ?? [] {
            item.isFavorite = false
            if !isVolumesNil { volumes?.items?.append(item) }
        }
        if isVolumesNil { volumes = bookVolumes }
        setDataSource(toAll: true)
    }
    
    @IBAction private func favSwitchAction(_ sender: UISwitch) {
        setDataSource(toAll: !favSwitch.isOn)
    }
    
    private func setDataSource(toAll: Bool) {
        tableItems = Items()
        volumes?.items?.forEach {
            var item = $0
            if toAll || item.isFavorite { tableItems?.append(item) }
        }
        updateUI()
    }
    
    private func updateUI() {
        if Thread.isMainThread {
            volumesTableView.reloadData()
        } else {
            DispatchQueue.main.async {
                self.volumesTableView.reloadData()
            }
        }
    }
}
