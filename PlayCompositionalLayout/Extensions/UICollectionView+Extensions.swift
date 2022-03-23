//
//  UICollectionView+Extensions.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/20.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable view")
        }
        return view
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(with type: T.Type, kind: String,
                                                                       for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: type),
                                                          for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable view")
        }
        return view
    }

    func register<T: UICollectionViewCell>(type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: type))
    }

    func register<T: UICollectionViewCell>(type: T.Type, kind: String) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: type))
    }
}
