//
//  ShoppingPageViewController.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 9/11/16.
//

import UIKit
import Foundation

class ShoppingPageViewController: UIViewController {

    @IBOutlet weak var LeftBarButton: UIBarButtonItem!
    
    //featured product outlets
    @IBOutlet weak var featuredItemName: UILabel!
    @IBOutlet weak var featuredItemPrice: UILabel!
    @IBOutlet weak var featuredProductPicture: UIImageView!
    
    //left middle product
    @IBOutlet weak var leftMiddleItemName: UILabel!
    @IBOutlet weak var leftMiddleItemPrice: UILabel!
    @IBOutlet weak var leftMiddleItemPicture: UIImageView!
    
    //left bottom product
    @IBOutlet weak var leftBottomItemName: UILabel!
    @IBOutlet weak var leftBottomItemPrice: UILabel!
    @IBOutlet weak var leftBottomItemPicture: UIImageView!
    
    
    //right middle product
    @IBOutlet weak var rightMiddleItemName: UILabel!
    @IBOutlet weak var rightMiddleItemPrice: UILabel!
    @IBOutlet weak var rightMiddleItemPicture: UIImageView!
    
    //right bottom product
    @IBOutlet weak var rightBottomItemName: UILabel!
    @IBOutlet weak var rightBottomItemPrice: UILabel!
    @IBOutlet weak var rightBottomItemPicture: UIImageView!
    
    var imageRepo = ImageRepository()
    var itemsInCartValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Shop"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Arial", size: 17)!]
        
        //size of ionicon icon size

        
        //populating cells of each product slot
        featuredItemContents()
        leftMiddleProductContents()
        leftBottomProductContents()
        rightMiddleProductContents()
        rightBottomProductContents()
        
        updateCartValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addToCart()
    {
        //itemsInCartValue += 1
        updateCartValue()
        print("number of items in cart: \(masterShoppingCart.numberOfItemsInCart()+1)")
    }
    
    func updateCartValue()
    {
        //creating a custom view for the right bar button item with a label+cart image
        let button =  UIButton(type: .custom)
        //let shoppingCartIcon = UILabel.labelWithIonicon(.iOSCart, color: .black, iconSize: 30)
        //button.setImage(shoppingCartIcon, for: .normal)
        button.setImage(UIImage.imageWithIonicon(.iOSCart, color: UIColor.defaultTint, iconSize: 40, imageSize: CGSize(width: 40, height: 40)), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        button.imageEdgeInsets = UIEdgeInsets(top: -1, left: 15, bottom: 1, right: -15)//move cart to the right
        button.addTarget(self, action: #selector(ShoppingPageViewController.cartButtonTapped), for: .touchUpInside)
        if !(masterShoppingCart.numberOfItemsInCart() <= 0) {
            //only show cart bubble if there is 1 or more items in the cart
            let label = UILabel(frame: CGRect(x: 12, y: -5, width: 20, height: 20))
            label.font = UIFont(name: "Arial-BoldMT", size: 16)
            label.text = String(masterShoppingCart.numberOfItemsInCart())
            label.textAlignment = .center
            label.textColor = UIColor.white
            label.backgroundColor =   UIColor.red
            //making label more circular
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            button.addSubview(label)
        }
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func cartButtonTapped()
    {   //shoppingCartList
        print("cart button tapped!")
        masterShoppingCart.printCartContents()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CartNavID") as! UINavigationController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func featuredItemContents()
    {
        //original image
        let imageToDisplay = imageRepo.getImageWithIndex(4)
        //resized image based on parameter height
        let resizedImageToDisplay = imageRepo.resizeImageBasedOnParameterHeight(featuredProductPicture.bounds.height, image: imageToDisplay!)
        featuredProductPicture.image = resizedImageToDisplay
        featuredItemName.text = "Featured Item: Magician Hat"
        featuredItemPrice.text = "$39.99"
    }
    
    func leftMiddleProductContents()
    {   //nike tennis shoes
        let imageToDisplay = imageRepo.getImageWithIndex(0)
        let resizedImageToDisplay = imageRepo.resizeImageBasedOnParameterHeight(leftMiddleItemPicture.bounds.height, image: imageToDisplay!)
        leftMiddleItemPicture.image = resizedImageToDisplay
        leftMiddleItemName.text = "Sneakers A"
        leftMiddleItemPrice.text = "$59.95"
    }
    
    func leftBottomProductContents()
    {   //red converse
        let imageToDisplay = imageRepo.getImageWithIndex(1)
        let resizedImageToDisplay = imageRepo.resizeImageBasedOnParameterHeight(leftBottomItemPicture.bounds.height, image: imageToDisplay!)
        leftBottomItemPicture.image = resizedImageToDisplay
        leftBottomItemName.text = "Shoes B"
        leftBottomItemPrice.text = "$34.99"
    }
    
    func rightMiddleProductContents()
    {   //pink dress
        let imageToDisplay = imageRepo.getImageWithIndex(5)
        let resizedImageToDisplay = imageRepo.resizeImageBasedOnParameterHeight(rightMiddleItemPicture.bounds.height, image: imageToDisplay!)
        rightMiddleItemPicture.image = resizedImageToDisplay
        rightMiddleItemName.text = "Dress A"
        rightMiddleItemPrice.text = "$89.99"
    }
    
    func rightBottomProductContents()
    {   //black dress
        let imageToDisplay = imageRepo.getImageWithIndex(6)
        let resizedImageToDisplay = imageRepo.resizeImageBasedOnParameterHeight(rightBottomItemPicture.bounds.height, image: imageToDisplay!)
        rightBottomItemPicture.image = resizedImageToDisplay
        rightBottomItemName.text = "Dress B"
        rightBottomItemPrice.text = "$99.00"
    }
    

    @IBAction func addFeaturedItemToCart(_ sender: UIButton) {
        //add magician hat to cart
        addItemToCart(itemName: "Magician Hat", itemPrice: 39.99)
        addToCart()
    }
    
    @IBAction func addMiddleLeftItemToCart(_ sender: UIButton) {
        //add sneakers A to cart
        addItemToCart(itemName: "Sneakers A", itemPrice: 59.95)
        addToCart()
    }
    
    @IBAction func addMiddleRightItemToCart(_ sender: UIButton) {
        //add dress A to cart
        addItemToCart(itemName: "Dress A", itemPrice: 89.99)
        addToCart()
    }
    
    @IBAction func addBottomRightItemToCart(_ sender: UIButton) {
        //add dress B to cart
        addItemToCart(itemName: "Dress B", itemPrice: 99.00)
        addToCart()
    }

    @IBAction func addBottomLeftItemToCart(_ sender: UIButton) {
        //add shoes B to cart
        addItemToCart(itemName: "Shoes B", itemPrice: 34.99)
        addToCart()
    }
    
    func addItemToCart(itemName: String, itemPrice: Double)
    {
        let quantity = masterShoppingCart.findItemAndReturnQuantity(itemName: itemName)
        var item = ItemToBuy(name: itemName, price: itemPrice, quantity: 1)
        masterShoppingCart.printCartContents()

        if (quantity == 0){
            masterShoppingCart.cartContentsArray.append(item)
        }
        
        else{
            //if there is one, find the entry and add one to the total quantity
            for index in 0...masterShoppingCart.numberOfDifferentCartItems()-1
            {
                if (masterShoppingCart.cartContentsArray[index].name == itemName)
                {
                    masterShoppingCart.cartContentsArray.remove(at: index)
                    item.quantity = quantity + 1
                    masterShoppingCart.cartContentsArray.append(item)
                }
            }
        }
    }
    
}
