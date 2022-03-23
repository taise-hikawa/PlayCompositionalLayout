//
//  SectionProtocol.swift
//  PlayCompositionalLayout
//
//  Created by 樋川大聖 on 2022/03/19.
//

import UIKit

protocol SectionProtocol {
    var numberOfItems: Int { get }
    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection
    func configureCell(_ viewController: ViewController, at indexPath: IndexPath) -> UICollectionViewCell
    func selectItem(_ viewController: ViewController, at indexPath: IndexPath)
    func header(_ viewController: ViewController, at indexPath: IndexPath) -> HeaderCell
}
