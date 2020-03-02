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
    private var startIndex = 0
    private var maxResults = 0
    
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
            volumesTableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = tableItems?[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell
        cell?.setModel(item)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        guard let vc = detailVC else { return }
        detailVC?.setupUI(tableItems?[row])
        if splitViewController?.isCollapsed ?? false {
            splitViewController?.showDetailViewController(vc, sender: self)
        }
    }
    
    func isLastIndex(_ indexPath: IndexPath?) -> Bool {
        let lastSectionIndex = volumesTableView.numberOfSections - 1
        let lastRowIndex = volumesTableView.numberOfRows(inSection: lastSectionIndex) - 1
        return indexPath?.section == lastSectionIndex && indexPath?.row == lastRowIndex
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if currentOffset + 15.0 > maximumOffset {
            getBookVolumes()
        }
    }
    
    func getBookVolumes() {
        if favSwitch.isOn { return }
        let urn = "https://www.googleapis.com/books/v1/volumes"
        let uri = "\(urn)?q=ios&maxResults=\(maxResults)&startIndex=\(startIndex)"
        guard let jsonURL = URL(string: uri) else { return }
        weak var zelf = self
        let start = Date()
        jsonURL.asyncDownload { data, response, error in
            print("Download ended:", Date().description(with: .current))
            print("Elapsed Time:", Date().timeIntervalSince(start), terminator: " seconds\n")
            print("Data size:", data?.count ?? "nil", terminator: " bytes\n\n")

            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let bookVolumes = try jsonDecoder.decode(BookVolumes.self, from: data)
                if let unwrappedSelf = zelf {
                    unwrappedSelf.setBookVolumes(bookVolumes)
                    unwrappedSelf.startIndex += unwrappedSelf.maxResults
                    return
                }
            } catch {
                print("JSONSerialization error:", error)
            }
            print("asyncDownload error: \(uri)")
        }
    }
    
    func setBookVolumes(_ bookVolumes: BookVolumes?) {
        if volumes == nil {
                for var item in bookVolumes?.items ?? [] {
                    item.isFavorite = false
            }
            volumes = bookVolumes
        } else {
                for var item in bookVolumes?.items ?? [] {
                    item.isFavorite = false
                    volumes?.items?.append(item)
            }
        }
        setTableDataSource(all: true)
    }
    
    @IBAction func favSwitchAction(_ sender: UISwitch) {
        setTableDataSource(all: !favSwitch.isOn)
    }
    
    func setTableDataSource(all: Bool) {
        tableItems = Items()
        for var item in volumes?.items ?? [] {
            if all || item.isFavorite {
                tableItems?.append(item)
            }
        }
        volumesTableView.reloadData()
    }
}
