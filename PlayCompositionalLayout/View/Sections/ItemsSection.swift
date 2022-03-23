//
//  ItemsSection.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import UIKit

struct ItemsSection {
    let items: [Item]
    init(items: [Item]) {
        self.items = items
    }
}

extension ItemsSection: SectionProtocol {
    var numberOfItems: Int {
        items.count
    }

    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(0.5),
                                              heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                               heightDimension: .fractionalWidth(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.dequeueReusableCell(with: ItemCell.self, for: indexPath)
        cell.configureCell(item: items[indexPath.row])
        return cell
    }

    func selectItem(_ controller: ViewController, at indexPath: IndexPath) {
        // TODO: screen transition
    }
}
