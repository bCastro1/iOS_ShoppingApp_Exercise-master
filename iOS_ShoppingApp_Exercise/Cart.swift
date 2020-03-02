//
//  Cart.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 10/17/16.
//  Copyright © 2016 WellsFargoMobileInnovations. All rights reserved.
//

import Foundation


struct ItemToBuy
{
    var name: String!
    var price: Double!
    var quantity: Int!
    //var eventDate: String!
    
    init(name: String, price: Double, quantity: Int)
    {   //item to buy
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
}

class ShoppingCart {
    var cartContentsArray = [ItemToBuy]()
    
    func numberOfItemsInCart() ->Int
    {
        var itemsInCart = 0
        if (cartContentsArray.count > 0){
            for index in 0...cartContentsArray.count-1
            {
                itemsInCart += cartContentsArray[index].quantity
            }
        }
        return itemsInCart
    }
    
    func printCartContents()
    {
        if (cartContentsArray.count-1 > 0){
            for index in 0...cartContentsArray.count-1
            {
                print("Item: \(cartContentsArray[index].name ?? " ")")
                print("Item price: \(cartContentsArray[index].price ?? 0.0)")
            }
        }
    }
    
    func numberOfDifferentCartItems() -> Int
    {
        return cartContentsArray.count
    }
    func findItemAndReturnQuantity(itemName: String) -> Int
    {
        var quantity = 0
        if (cartContentsArray.count-1 >= 0){
            for index in 0...cartContentsArray.count-1
            {
                if (cartContentsArray[index].name == itemName)
                {
                    quantity = cartContentsArray[index].quantity
                }
            }
        }
        return quantity
    }
}
