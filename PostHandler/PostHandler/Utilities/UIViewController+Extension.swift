//
//  UIViewController+Extension.swift
//  PostHandler
//
//  Created by linto jacob on 05/08/22.
//

import UIKit

extension UIViewController {

    func showAlert(title: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            self.present(alertController, animated: true, completion: { Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {_ in
                self.dismiss(animated: true, completion: nil)
            })})
        }
    }

    func showErrorAlert(title: String = "Error!", msg: String, buttonTitle: String = "Ok") {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
