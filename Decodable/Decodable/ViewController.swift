//
//  ViewController.swift
//  Decodable
//
//  Created by Deftsoft on 14/02/20.
//  Copyright © 2020 Deftsoft. All rights reserved.
//

import UIKit
import Foundation
let BASE_URL = "https://api.github.com/users/"
class ViewController: UIViewController {
    let url = BASE_URL.appending("shashikant86")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      guard let apiUrl = URL(string: url) else { return }
    
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data else { return }
            do {
                let	gigData = try JSONDecoder().decode(MyGitHubUser.self, from: data)
                print(gigData)
            }
            catch  let errr {
                print("Error", errr)
            }
        }.resume()
        
    }
    
    
    
    
    

}

struct MyGitHubUser:Decodable {
    let login:String?
    let id:Int?
    let avatarUrl:String?
    let htmlUrl:String?
    let followersUrl:String?
    let followingUrl:String?
    let reposUrl:String?
    let created:String?
    let updatedAt:String?
    
    private enum CodingKeys: String,CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl  = "following_url"
        case reposUrl = "repos_url"
        case created = "created_at"
        case updatedAt = "updated_at"
    }
}





