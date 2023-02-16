//
//  UserModal.swift
//  AssignmentofSurveyHeart
//
//  Created by iOSnaveenG on 15/02/23.
//

import UIKit

struct UserModalList : Decodable{

    var resultsList = [UserData]()
    
    private enum CodingKeys: String, CodingKey{
        case resultsList = "results"
    }
}

struct UserData : Decodable {
    
    let gender: String
    let email:String
    let cell:String
    let name: name
    let picture: picture
    
    private enum CodingKeys: String, CodingKey{
        case gender = "gender"
        case email = "email"
        case cell = "cell"
        case name
        case picture
    }
}
struct name : Decodable {
    let title: String
    let first: String
    let last: String
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case first = "first"
        case last = "last"
    }
}

struct picture : Decodable{
    let large: String
    let medium: String
    let thumbnail: String
    
    private enum CodingKeys: String, CodingKey{
        case large = "large"
        case medium = "medium"
        case thumbnail = "thumbnail"
    }
}
