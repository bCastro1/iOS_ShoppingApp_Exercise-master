//
//  ShoppingCart.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 9/12/16.
//  Copyright © 2016 WellsFargoMobileInnovations. All rights reserved.
//

import Foundation

struct ItemToBuy
{
    var name: String!
    var price: Int!
    var eventDate: String!
    
    init(name: String, price: Int)
    {   //item to buy
        self.name = name
        self.price = price
    }
    
    init(eventName: String, eventPrice: Int, eventDate: String)
    {   //booking event
        self.name = eventName
        self.price = eventPrice
        self.eventDate = eventDate
    }
}

class ShoppingCart {
    var cartContentsArray = [ItemToBuy]()
    
    func numberOfItemsInCart() ->Int
    {
        return cartContentsArray.count
    }
}