//
//  ExtensionFile.swift
//  Alamofire Get API
//
//  Created by Vesperia on 8/9/17.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController{
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func showValidationAlert(_ message: String, title: String) {
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    public func showProgressDialog(){
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
    }
    public func showProgressDialog(completion: () -> Void){
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
        completion()
    }
    
    public func closeProgressDialog(){
        MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
    }
}
