//
//  ViewController.swift
//  NetworkCall
//
//  Created by Jack on 27/02/20.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

struct Post: Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let body: [String : Any] = ["title": "foo",
                                          "body": "bar",
                                          "userId": 1]
        NetworkCall(data: body, url: nil, service: .posts, method: .post).executeQuery(){
            (result: Result<Post,Error>) in
            switch result{
            case .success(let post):
                print(post)
            case .failure(let error):
                print(error)
            }
        }
        /*
        NetworkCall(data: [:], url: nil, service: .posts, method: .get, isJSONRequest: false).executeQuery(){
            (result: Result<[Post],Error>) in
            switch result{
            case .success(let post):
                print(post)
            case .failure(let error):
                print(error)
            }
        }*/
        /*
        NetworkCall(data: ["email":"peter@klaven"], url: "https://reqres.in/api/login", method: .post, isJSONRequest: false).executeQuery(){
            (result: Result<Post,Error>) in
            switch result{
            case .success(let post):
                print(post)
            case .failure(let error):
                print(error)
            }
        }
        */
        /*
        NetworkCall(data: ["username":"sahil.manchanda2@gmail.com"], headers: ["custom-header-key" : "custom-header-value"], url: "https://httpbin.org/post",  method: .post).executeQuery(){(result: Result<String,Error>) in
            switch result{
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }*/
    }
}
