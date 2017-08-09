//
//  BaseViewController.swift
//  VineLabTask
//
//  Created by Hussein Jaber on 9/8/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        SVProgressHUD.setForegroundColor(UIColor.appBlue)
        SVProgressHUD.show(withStatus: "Fetching data..")
    }
    
    func hideLoader() {
        UIApplication.shared.endIgnoringInteractionEvents()
        SVProgressHUD.dismiss()
    }


}
