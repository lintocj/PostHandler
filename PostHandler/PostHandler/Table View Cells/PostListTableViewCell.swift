//
//  PostListTableViewCell.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }

    var postInfo: Posts? {
        didSet {
            setUIElements()
        }
    }

    func setUIElements() {
        self.lblTitle.text = postInfo?.title
        self.lblDesc.text = postInfo?.body
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
