//
//  ViewController.swift
//  Calling API
//
//  Created by GCO on 26/03/21.
//  Copyright © 2021 Yashashrig. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var TxtField: UITextField!
    @IBOutlet weak var Display: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenLabel.text  = "hello"
    }
    
    
    @IBAction func getTokenPressed(_ sender: Any) {
        
        
        let userId =  TxtField.text
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            textField.resignFirstResponder()
            return true
            
        }
        
        
    // Create URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(userId!)" )
        guard let requestUrl = url  else { fatalError() }

        
         
    // Create URL Request
    var request = URLRequest(url: requestUrl)

    // Specify HTTP Method to use
    request.httpMethod = "GET"

    // Send HTTP Request
    let task = URLSession.shared.dataTask(with: requestUrl) { (data, response, error) in
        
        // Check if Error took place
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
        
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(dataString)")
        }
        
        
    }
    task.resume()
        }
   
 
   
    
    

}

