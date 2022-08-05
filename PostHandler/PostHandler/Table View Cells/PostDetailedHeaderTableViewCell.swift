//
//  PostDetailedHeaderTableViewCell.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostDetailedHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }

    var postDataUpdate: Posts? {
        didSet {
            setUpUI()
        }
    }

    func setUpUI() {
        lblTitle.text = postDataUpdate?.title
        lblDesc.text = postDataUpdate?.body
    }

}
