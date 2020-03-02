//
//  Utilities.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 9/10/16.
//

import UIKit

//show simple alert helper
func showSimpleAlertWithTitle(_ title: String!, message: String, viewController: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(action)
    viewController.present(alert, animated: true, completion: nil)
}

var masterShoppingCart = ShoppingCart()

let blueIconColor = UIColor(red: 59, green: 89, blue: 152, alpha: 1)

extension UIColor {
    static let defaultTint = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
}
