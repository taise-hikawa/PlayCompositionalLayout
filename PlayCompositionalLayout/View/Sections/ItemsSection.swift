//
//  ItemsSection.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/23.
//

import UIKit

struct ItemsSection {
    enum ItemSectionType {
        case history
        case sale
        case recommend

        var headerTitle: String {
            switch self {
            case .history: return "チェックしたアイテム"
            case .sale: return "クーポン対象アイテム"
            case .recommend: return "おすすめアイテム"
            }
        }
    }
    let items: [Item]
    let type: ItemSectionType
    init(items: [Item], type: ItemSectionType) {
        self.items = items
        self.type = type
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
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
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

    func header(_ view: UICollectionView, at indexPath: IndexPath) -> HeaderCell {
        let cell = view.dequeueReusableSupplementaryView(with: HeaderCell.self,
                                                         kind: UICollectionView.elementKindSectionHeader,
                                                         for: indexPath)
        cell.configureCell(title: type.headerTitle)
        return cell
    }
}
