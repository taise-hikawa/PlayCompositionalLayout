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
    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func selectItem(_ controller: ViewController, at indexPath: IndexPath)
}
