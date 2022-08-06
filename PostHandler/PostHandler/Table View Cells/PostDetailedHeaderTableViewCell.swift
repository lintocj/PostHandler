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
    @IBOutlet weak var btnComment: UIButton!

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }

    var postDataUpdate: Posts? {
        didSet {
            setUIElements()
        }
    }

    func setUIElements() {
        lblTitle.text = postDataUpdate?.title
        lblDesc.text = postDataUpdate?.body
    }

    var settotalComment: Int = 0 {
        didSet {
            btnComment.setTitle(" \(settotalComment)", for: .normal)
        }
    }
}
