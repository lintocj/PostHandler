//
//  PostListTableViewCell.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
