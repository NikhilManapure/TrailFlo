//
//  ItemCell.swift
//  Trail Flo
//
//  Created by Nikhil Manapure on 19/01/18.
//
//

import UIKit

class ItemCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(with item: Item) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}
