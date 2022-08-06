//
//  SearchView.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

// MARK: Custom Protocol for Search
public protocol searchDelegate: AnyObject {
    func didSearchResult(searchText: String?)
}

@IBDesignable
class SearchView: UIView {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contentView: UIView!
    public weak var delegate: searchDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle(for: SearchView.self)
        bundle.loadNibNamed("SearchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.searchBar.searchTextField.backgroundColor = .clear
    }

    /// Used for placeHolder Updation from Parent View
    func placeHolderUpdation(placeHolder: String) {
        self.searchBar.placeholder = placeHolder
    }
}

// MARK: Search Bar Delegation
extension SearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        self.delegate?.didSearchResult(searchText: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchText \(String(describing: searchBar.text))")
        self.delegate?.didSearchResult(searchText: searchBar.text)
    }
}
