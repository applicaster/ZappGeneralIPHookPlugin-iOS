//
//  ZappHookErrorViewController.swift
//  Zapp-App
//
//  Created by user on 18/12/2018.
//  Copyright © 2018 Applicaster LTD. All rights reserved.
//

import Foundation
import UIKit

open class ZappHookErrorViewController: UIViewController {
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
//        ZAAppConnector.sharedInstance().layoutsStylesDelegate.setLabelStyle(errorMessageLabel, withKeys:[:])
//
//        view.backgroundColor = GAUICustomizationHelper.color(forKey: AppLoadingBGColor)
    }
}
