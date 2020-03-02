//
//  ImageRepository.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 9/10/16.
//

import UIKit

class ImageRepository: NSObject {
    //main product page slide show
    let mainPageImageNames = ["product0.jpg", "product1.jpg", "product2.jpg", "product3.jpg"]
    
    func numberOfMainPageImages() -> Int{
        //returning total number of images
        return mainPageImageNames.count
    }
    
    func getImageWithIndex(_ idx: Int) ->UIImage? {
        //returning image at given index
        if let image = UIImage(named: "product\(idx).jpg")
        {
            return image
        }
        return nil
    }
    
    func resizeImageBasedOnParameterHeight(_ height: CGFloat, image: UIImage) ->UIImage?
    {
        //new neight based on the image view bounds
        //scale image to size of imageView
        let scale = height / image.size.height
        
        //new width based on the scale of height
        let newWidth = image.size.width * scale
        
        //making the new photo with new given height + width
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: height))
        let newImageToDisplay = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImageToDisplay
    }
    
}
