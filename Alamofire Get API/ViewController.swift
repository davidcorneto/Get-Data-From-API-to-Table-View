//
//  ViewController.swift
//  Alamofire Get API
//
//  Created by Vesperia on 8/9/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var EdtPassword: UITextField!

    @IBOutlet weak var edtEmail: UITextField!
    var listData: [[String:AnyObject]] = [[String:AnyObject]]()
    var hud: MBProgressHUD = MBProgressHUD()
    
    @IBOutlet weak var tableView: UITableView!
     let preferences = UserDefaults.standard
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hide keyboard
        self.hideKeyboardWhenTappedAround()
        
        //cek user login
        cekLoginSession()
        
        print("3")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let url:URL = URL(string:"https://goglobal.id/piserver/v1/getdatadummy/")!
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            switch response.result{
            case .success:
                self.listData = response.result.value as! [[String:AnyObject]]
                self.tableView.reloadData()
            
            case .failure(let error):
                print(error)
            }
        
        })
        

     
    }
    
    func cekLoginSession(){
        if (preferences.string(forKey: "EMAIL")?.isEmpty)!{
            print("1")
            showValidationAlert("Belum LOGIN", title: "Warning")
        }else{
            print("2")
            edtEmail.text! = preferences.string(forKey: "EMAIL")!
            EdtPassword.text! = preferences.string(forKey: "PASSWORD")!
        }
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        if edtEmail.text!.isEmpty || EdtPassword.text!.isEmpty{
        
            showValidationAlert("Test Alert", title: "Warning")
        
        }else{
           
            
            preferences.set(edtEmail.text!, forKey: "EMAIL")
            preferences.set(EdtPassword.text!, forKey: "PASSWORD")
            preferences.synchronize()
            
            performSegue(withIdentifier: "goLogin", sender: self)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let item = self.listData[indexPath.row]
        
        cell.textLabel?.text = item["Ten"] as? String
        
        
        return cell
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}

