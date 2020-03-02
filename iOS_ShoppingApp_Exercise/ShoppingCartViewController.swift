//
//  ShoppingCartViewController.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 10/17/16.
//  Copyright © 2016 WellsFargoMobileInnovations. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, CustomCellDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var finalPriceTextLabel: UILabel!
    @IBOutlet weak var cartList: UITableView!
    var cellCount: Int = 0
    var cellDelegate: CustomCellDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        cartList.dataSource = self
        // Do any additional setup after loading the view.
        print("number: \(masterShoppingCart.numberOfItemsInCart())")
        setFinalPriceAmount()
        self.navigationItem.title = "Shop"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Arial", size: 17)!]

        backButton = UIBarButtonItem(title: ionicon.ChevronLeft.rawValue, style: .plain, target: self, action: #selector(backButtonPressed))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func setFinalPriceAmount()
    {
        var finalPrice: Double = 0
        if (masterShoppingCart.numberOfDifferentCartItems() > 0){
            for index in 0...masterShoppingCart.numberOfDifferentCartItems()-1
            {
                let totalForEachItem = masterShoppingCart.cartContentsArray[index].price * Double(masterShoppingCart.cartContentsArray[index].quantity)
                finalPrice += totalForEachItem
            }
            finalPriceTextLabel.text = "Total: $\(String(format: "%.2f", finalPrice))"
        }
        else
        {
            finalPriceTextLabel.text = "You have not added anything to your cart!"
        }
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {

        return masterShoppingCart.numberOfDifferentCartItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell: CustomCartCell!
        if (tableView == self.cartList){
            cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCartCell)
            let itemNameInCell = masterShoppingCart.cartContentsArray[indexPath.row].name
            let itemPrice = masterShoppingCart.cartContentsArray[indexPath.row].price
            cell.productNameLabel.text = "\(itemNameInCell!) : $\(itemPrice!)"
            cell.quantityTextField.text = String(masterShoppingCart.findItemAndReturnQuantity(itemName: itemNameInCell!))
        }
        cell.delegate = self
        return cell
    }

    func updateCartValueButtonPressed(_ cell: CustomCartCell)
    {
        
    }
}
