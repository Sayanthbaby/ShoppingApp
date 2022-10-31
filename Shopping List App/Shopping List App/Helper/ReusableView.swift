//
//  ReusableView.swift
//  Shopping List App
//
//  Created by kurupareshan pathmanathan on 10/27/22.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension ShoppingTableViewCell: ReusableView {}

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: NibLoadableView {}
extension UITableViewCell: NibLoadableView {}

//MARK: UITableView
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView{
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

//MARK: UICollectionView
extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

