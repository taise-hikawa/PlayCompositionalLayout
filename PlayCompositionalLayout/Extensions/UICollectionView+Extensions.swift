//
//  UICollectionView+Extensions.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/20.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as! T
    }

    func register<T: UICollectionViewCell>(type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: type))
    }
}
