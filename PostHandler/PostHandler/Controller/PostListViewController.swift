//
//  PostListViewController.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

class PostListViewController: UIViewController {
    @IBOutlet weak var headerView: SearchView! {
        didSet {
            headerView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       // self.view.backgroundColor = .red
    }
}
extension PostListViewController: searchDelegate {
    func didSearchResult(searchText: String?) {

    }
}
