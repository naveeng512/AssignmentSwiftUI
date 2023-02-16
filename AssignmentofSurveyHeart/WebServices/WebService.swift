//
//  WebService.swift
//  AssignmentofSurveyHeart
//
//  Created by iOSnaveenG on 15/02/23.
//

import Foundation

fileprivate enum NetworkError: Error{
    case InvalidURL
    case DataNotFound
}

class WebService{
    
    static func getUsersList() async throws -> [UserData]{
        
        guard let url = URL(string: AppConstants.webserverURL) else{
            throw NetworkError.InvalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let userResponse = try? JSONDecoder().decode(UserModalList.self, from: data)
        guard let userResponse = userResponse else{
            throw NetworkError.DataNotFound
        }
        return userResponse.resultsList
    }
}
