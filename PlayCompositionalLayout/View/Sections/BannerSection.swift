//
//  BannerSection.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/24.
//

import UIKit

struct BannerSection {
    let banners: [Banner]
}

extension BannerSection: SectionProtocol {
    var numberOfItems: Int {
        banners.count
    }

    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }

    func configureCell(_ viewController: ViewController, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewController.collectionView.dequeueReusableCell(with: BannerCell.self, for: indexPath)
        cell.configureCell(banner: banners[indexPath.row], parent: viewController)
        return cell
    }

    func selectItem(_ viewController: ViewController, at indexPath: IndexPath) {
        // TODO:
    }

    func header(_ viewController: ViewController, at indexPath: IndexPath) -> HeaderCell {
        viewController.collectionView.dequeueReusableSupplementaryView(with: HeaderCell.self,
                                                                                  kind: UICollectionView.elementKindSectionHeader,
                                                                                  for: indexPath)
    }
}
