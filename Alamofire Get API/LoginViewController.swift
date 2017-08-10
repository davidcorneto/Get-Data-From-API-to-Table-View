//
//  LoginViewController.swift
//  Alamofire Get API
//
//  Created by Vesperia on 8/9/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation




class LoginViewController: UIViewController {

    @IBOutlet weak var txt1: UILabel!
    @IBOutlet weak var txt2: UILabel!
    @IBOutlet weak var txt3: UILabel!
    @IBOutlet weak var txt4: UILabel!
    @IBOutlet weak var txt5: UILabel!
    @IBOutlet weak var txt6: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //Declare User preferences
        let preferences = UserDefaults.standard
        
        txt1.text! = preferences.string(forKey: "EMAIL")!
        txt2.text! = preferences.string(forKey: "PASSWORD")!
        
                let todoEndpoint: String = "https://codewithchris.com/code/afsample.json"
                Alamofire.request(todoEndpoint)
                    .responseJSON{ response in
                        print("Request: \(String(describing: response.request))")   // original url request
                        print("Response: \(String(describing: response.response))") // http url response
                        print(response.data!)
                        print("Result: \(response.result)")                         // response serialization result
        
                        if let json = response.result.value {
                            print("JSON: \(json)") // serialized json response
                        }
        
                        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                            print("Data: \(utf8Text)") // original server data as UTF8 string
                        }
                        
                    }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    

}
