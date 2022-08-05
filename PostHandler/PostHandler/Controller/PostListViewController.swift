//
//  PostListViewController.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var searchView: SearchView! {
        didSet {
            searchView.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }
    var postData: [Posts]?
    var originalpostData: [Posts]?

    override func viewDidLoad() {
        super.viewDidLoad()
        apiHandler()
    }

    // MARK: API Call Handle
    func apiHandler() {
        self.activityIndicator.startAnimating()
        PostDataViewModel.getPostData { response in
            switch response {
            case .success(let post):
                self.showAlert(title: "Success")
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.postData = post
                    self.originalpostData = post
                    self.tableView.isHidden = self.postData?.isEmpty == true || self.postData == nil ? true : false
                    self.tableView.reloadData()
                }
            case .error(let error):
                self.showErrorAlert(msg: error)
            }
        }
    }

    // MARK: Navigation
    func moveToPostDetailedViewController(postData: Posts?) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostDetailedViewController") as? PostDetailedViewController {
            viewController.postInfo = postData
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}

extension PostListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostListTableViewCell.identifier, for: indexPath) as? PostListTableViewCell else {
            return UITableViewCell()
        }
        if let userInfo = self.postData?[indexPath.row] {
            cell.textLabel?.text = userInfo.title
            cell.textLabel?.numberOfLines = 0
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let post = self.postData?[indexPath.row] {
            self.moveToPostDetailedViewController(postData: post)
        }

    }
}

extension PostListViewController: searchDelegate {
    func didSearchResult(searchText: String?) {
        if let searchText = searchText, searchText != "" {
            self.postData = originalpostData?.filter { (postList) -> Bool in
                if let title = postList.title {
                    return title.localizedCaseInsensitiveContains(searchText)
                }
                return false
            }
        } else {
            self.postData = originalpostData
        }
        self.tableView.reloadData()
    }
}
