//
//  Extensions.swift
//  BookStore_CarlosNeto
//
//  Created by Carlos Neto on 02/03/2020.
//  Copyright © 2020 Carlos Neto. All rights reserved.
//

import UIKit

extension UIView {
    
    class func with(identifier: String?) -> Self? {
        return with(type: self, identifier: identifier)
    }
    
    private class func with<T: UIView>(type: T.Type, identifier: String?) -> T? {
        var views: [T] = []
        UIApplication.shared.windows.forEach {
            views += $0.allSubViewsOf(type: T.self)
        }
        return views.first(where: {
            $0.has(identifier: identifier)
        })
    }
    
    func allSubViewsOf<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        func append(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard view.subviews.count > 0 else { return }
            view.subviews.forEach{ append(view: $0) }
        }
        append(view: self)
        return all
    }
    
    func has(identifier: String?) -> Bool {
        guard let aIdentifier = identifier,
            let selfIdentifier = self.accessibilityIdentifier,
            !selfIdentifier.isEmpty,
            !aIdentifier.isEmpty else { return false }
        return aIdentifier == selfIdentifier
    }
}

extension URL {
    func asyncDownload(completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()) {
        URLSession.shared
            .dataTask(with: self, completionHandler: completion)
            .resume()
    }
}
