//
//  ViewController.swift
//  EncodeDecode
//
//  Created by Ramanan D2V on 8/8/19.
//  Copyright © 2019 D2V Software Solutions pvt ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func postAction(_ sender: Any) {
        
        //MARK: Normal method using JSONSerialization
        /*
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let param = ["body": "235","id": "2","title": "iOS Developer", "userId": "Apple"]
        
        do{
            let dataParam = try JSONSerialization.data(withJSONObject: param, options: [])
            request.httpBody = dataParam
        }catch{}
        
        URLSession.shared.dataTask(with: request) { (data, _, err) in
            print(err.debugDescription)
            
            guard let jData = data else { return }
            do{
                let json = try JSONSerialization.jsonObject(with: jData, options: [])
                print(json)
            }
            catch{
                print("Catch")
            }
        }.resume()
        */
        
        //MARK: Normal method using Encode&Decode
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postParam = Post(body: "Happy weekend", id: 1, title: "Hello", userId: 123)
        
        do {
            let postEncode = try JSONEncoder().encode(postParam)
            request.httpBody = postEncode
        }catch {}
        
        URLSession.shared.dataTask(with: request) { (rData, response, rError) in
            
            guard let resultData = rData else { return }
            do{
                let json = try JSONDecoder().decode(Post.self, from: resultData)
                print(json)
            }catch{}
        }.resume()
        

    }
    
    @IBAction func getAction(_ sender: Any) {
        
        //MARK: Normal method using JSONSerialization
        /*
         guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
 
        URLSession.shared.dataTask(with: url) { (dt, response, error) in
             print(error.debugDescription)
            guard let jData = dt else { return }
            do{
                let json = try JSONSerialization.jsonObject(with: jData, options: [])
                print(json)
            }catch{}
        }.resume()
        */
        
        //MARK: Normal method using Encode&Decode
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTask(with: url) { (gData, gResponse, gError) in
            
            guard let resultData = gData else { return }
            
            
            do{

                let users = try JSONDecoder().decode([Get].self, from: resultData)
      
                for user in users {
                   print(user)
                }
                
            }catch{}
            
        }.resume()
    }
    
    
}

