//
//  MainProductPageViewController.swift
//  iOS_ShoppingApp_Exercise
//
//  Created by Brendan Castro on 9/10/16.
//

import UIKit


class MainProductPageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    //image view outlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var advertisementSnippetView: UIView!
    @IBOutlet weak var advertisementSnippetHeader: UILabel!
    @IBOutlet weak var advertisementSnippetFooter: UILabel!
    @IBOutlet weak var launchAdvertismentButton: UIButton!
    
    
    @IBOutlet weak var shopButton: UIButton!
    
    @IBOutlet weak var dynamicLoyaltyAmountLabel: UILabel!
    @IBOutlet weak var dynamicOffersAmountLabel: UILabel!
    
    var imageRepo = ImageRepository()
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting name, font and size of title
        self.navigationItem.title = "Vogue Store"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Zapfino", size: 14)!]

        //starting off the image view with the first image to show
        updateImage(imageIndex)
        
        //            denyFriend.setImage(UIImage.imageWithIonicon(ionicon.CloseCircled, color: UIColor.red, iconSize: 30.0, imageSize: CGSize(width: 30, height: 30)), for: .normal)

    
        //left menu button
        leftBarButton.title = "Profile"
        
        //right person button
        rightBarButton.title = "Cart"
        
        setupButtonLogos()
    
        dynamicOffersAmountLabel.text = "1 new offer"
        
        //advertisement view and buttons
        hideAdvertisements(true)
    }
    
    func updateImage(_ idx: Int)
    {
        //original image
        let imageToDisplay = imageRepo.getImageWithIndex(idx)
        //resize image to fit in current image view window
        let resizedImageToDisplay = imageRepo.resizeImageBasedOnParameterHeight(productImageView.bounds.height, image: imageToDisplay!)
        productImageView.image = resizedImageToDisplay
        pageControl.currentPage = idx
    }
    
    func shouldShowAdvertisementLabels(_ imageIndex: Int)
    {
        if (imageIndex == 2)
        {   //fashion show advertisement
            hideAdvertisements(false)
            advertisementSnippetHeader.text = "Fashion Show"
            advertisementSnippetFooter.text = "December 1st 2016"
            launchAdvertismentButton.setTitle("Get Tickets >", for: .normal)
        }
        else if (imageIndex == 3)
        {   //personal shopper advert
            hideAdvertisements(false)
            advertisementSnippetHeader.text = "Personal Shopper"
            advertisementSnippetFooter.text = ""
            launchAdvertismentButton.setTitle("Book Now >", for: .normal)
        }
        else
        {
            //hide advert snippets and actions
            hideAdvertisements(true)
        }
    }
    
    
    func hideAdvertisements(_ hide: Bool)
    {   //hiding or showing advertisements labels and buttons
        advertisementSnippetView.isHidden = hide
        advertisementSnippetHeader.isHidden = hide
        advertisementSnippetFooter.isHidden = hide
        launchAdvertismentButton.isHidden = hide
    }
    
    @IBAction func RightSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        //swipe right -> move to next picture
        imageIndex = (imageIndex + imageRepo.numberOfMainPageImages() - 1) % imageRepo.numberOfMainPageImages()
        updateImage(imageIndex)
        shouldShowAdvertisementLabels(imageIndex)
    }

    @IBAction func LeftSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        //swipe left move to previous picture
        imageIndex = (imageIndex + 1) % imageRepo.numberOfMainPageImages()
        updateImage(imageIndex)
        shouldShowAdvertisementLabels(imageIndex)
    }
    
    @IBAction func LaunchCurrentAdvertisement(_ sender: UIButton) {
        //launch button based on which picture is up
        if (imageIndex == 2)
        {
            print("book fashion show tickets")
        }
        else if (imageIndex == 3)
        {
            print("book personal shopper date")
        }
    }

    func setupButtonLogos(){
        var shoppingCartLogo = UILabel()
        
        shoppingCartLogo = UILabel.labelWithIonicon(.iOSCart, color: .white, iconSize: 30)
        shoppingCartLogo.translatesAutoresizingMaskIntoConstraints = false
        shopButton.addSubview(shoppingCartLogo)
        shoppingCartLogo.heightAnchor.constraint(equalTo: shopButton.heightAnchor, constant: 2).isActive = true
        shoppingCartLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        shoppingCartLogo.topAnchor.constraint(equalTo: shopButton.topAnchor, constant: -2).isActive = true
        shoppingCartLogo.leftAnchor.constraint(equalTo: shopButton.leftAnchor, constant: 5).isActive = true

    }
}
