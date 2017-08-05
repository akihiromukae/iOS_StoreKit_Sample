//
//  ViewController.swift
//  StoreKitSample
//
//  Created by mukae on 2017/08/05.
//  Copyright © 2017年 mukae. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, SKStoreProductViewControllerDelegate {

    @IBAction func showStore(_ sender: Any) {
        showSKStoreViewController()
        print("open Store")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func showSKStoreViewController() {
        let productViewController = SKStoreProductViewController()
        productViewController.delegate = self
        
        present( productViewController, animated: true, completion: {() -> Void in
            
            let productID = "251598259" // Apple Store ID
//            let productID = "375380948" // Apple Store ID
            let parameters:Dictionary = [SKStoreProductParameterITunesItemIdentifier: productID]
            productViewController.loadProduct( withParameters: parameters, completionBlock: {(Bool, NSError) -> Void in

                // error
            })
        })
    }
    
    // when the cancel button is pushed
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        dismiss( animated: true, completion: nil);
        print("close Store")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

