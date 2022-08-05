//
//  PostDetailedViewController.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostDetailedViewController: UIViewController {

    var postInfo: Posts?
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(PostDetailedHeaderTableViewCell.nib, forHeaderFooterViewReuseIdentifier: PostDetailedHeaderTableViewCell.identifier)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
extension PostDetailedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell: PostDetailedHeaderTableViewCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: PostDetailedHeaderTableViewCell.identifier) as? PostDetailedHeaderTableViewCell else {
            return UITableViewCell()
        }
        cell.postDataUpdate = postInfo
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

}
