//
//  CommentTableViewCell.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblEmailID: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    var commentInfo: Comments? {
        didSet {
            setUIUpdation()
        }
    }

    func setUIUpdation() {
        lblTitle.text = commentInfo?.name
        lblEmailID.text = commentInfo?.email
        lblDesc.text = commentInfo?.body
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
