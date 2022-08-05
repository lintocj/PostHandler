//
//  PostDetailedViewController.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostDetailedViewController: UIViewController {

    var postInfo: Posts?
    var commentData: [Comments]?
    var originalCommentData: [Comments]?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(PostDetailedHeaderTableViewCell.nib, forHeaderFooterViewReuseIdentifier: PostDetailedHeaderTableViewCell.identifier)
        }
    }
    @IBOutlet weak var searchView: SearchView! {
        didSet {
            searchView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        apiHandler()
    }
    
    // MARK: API Call Handle
    func apiHandler() {
        //self.activityIndicator.startAnimating()
        let postId = String(describing: postInfo?.id ?? 0)
        CommentDataViewModel.getCommentData(postId: postId) { response in
            switch response {
            case .success(let comment):
                self.showAlert(title: "Success")
                DispatchQueue.main.async {
                    //self.activityIndicator.stopAnimating()
                    self.commentData = comment
                    self.originalCommentData = comment
                    self.tableView.isHidden = self.commentData?.isEmpty == true || self.commentData == nil ? true : false
                    self.tableView.reloadData()
                }
            case .error(let error):
                self.showErrorAlert(msg: error)
            }
        }
    }

}
extension PostDetailedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else {
            return UITableViewCell()
        }
        if let commentInfo = self.commentData?[indexPath.row] {
            cell.commentInfo = commentInfo
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
extension PostDetailedViewController: searchDelegate {
    func didSearchResult(searchText: String?) {
        if let searchText = searchText, searchText != "" {
            self.commentData = originalCommentData?.filter { (postList) -> Bool in
                if let name = postList.name, let emailId = postList.email, let body = postList.body {
                    let final = name + emailId + body
                    return final.localizedCaseInsensitiveContains(searchText)
                }
                return false
            }
        } else {
            self.commentData = originalCommentData
        }
        self.tableView.reloadData()
    }
}
