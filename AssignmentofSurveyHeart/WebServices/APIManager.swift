//
//  ApiManager.swift
//  AssignmentofSurveyHeart
//
//  Created by iOSnaveenG on 14/02/23.
//
import Alamofire
import Foundation

public typealias FailureMessage = String

/**
 API Manager is a singleton class for handle all network call.
 */
public class APIManager {
    
    static let webserverURL: String = "https://randomuser.me/api/?results=50"

    public static let shared = APIManager()

    func callAPI(serverURL: String? = "", strURL: String, queryItems: [URLQueryItem]? = nil, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, success: @escaping ((AFDataResponse<Any>) -> Void), failure: @escaping ((FailureMessage) -> Void)) {
        var finalURL = serverURL ?? ""

        if let serverURL = serverURL, serverURL == "" {
            finalURL = APIManager.webserverURL
        }

        guard var url = URLComponents(string: "\(finalURL)\(strURL)") else {
            failure("Invalid URL")
            return
        }

        if let queryItems = queryItems {
            url.queryItems = queryItems
        }

        // Network request
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    success(response)
                case let .failure(error):
                    failure(error.localizedDescription)
                }
            }
    }
}
