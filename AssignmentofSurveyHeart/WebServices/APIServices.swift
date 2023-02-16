import Alamofire
import Foundation

struct APIServices {
    public static let shared = APIServices()

//    func callCreateLogin(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CreateLoginResponse?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
//        var headers = HTTPHeaders()
//        headers["content-type"] = "application/json"
//
//        APIManager.shared.callAPI(strURL: AppConstants.URL.apiLogin, queryItems: queryItems, method: .post, headers: headers, parameters: parameters, success: { response in
//            do {
//                if let data = response.data {
//                    let createLoginResponse = try JSONDecoder().decode(CreateLoginResponse.self, from: data)
//                    success(createLoginResponse)
//                }
//            } catch {
//                failure(FailureMessage(error.localizedDescription))
//            }
//
//        }, failure: { error in
//            failure(FailureMessage(error))
//        })
//    }
    
//    func newUsersList() {
//
//        let urlString = APIManager.webserverURL
//
//           if let url = URL(string: urlString) {
//               DispatchQueue.main.async {
//
//                   if let data = try? Data(contentsOf: url) {
//                       // we're OK to parse!
//                       self.parse(json: data)
//                   }
//               }
//           }
//    }
   func parse(json: Data) {
        let decoder = JSONDecoder()
        var usersList = [UserData]()
        if let jsonPetitions = try? decoder.decode(UserModalList.self, from: json) {
            usersList = jsonPetitions.resultsList
        }
       print("Finally..",usersList[0].email)
    }
    func getUserlist() {
        var request = NSMutableURLRequest(url: NSURL(string: APIManager.webserverURL)! as URL)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                     if let jsonResult = try JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                         if let results = jsonResult["results"] as? [Any] {

//                             let userResponse = try? JSONDecoder().decode(UserModalList.self, from: data!)

                         }
                         self.parse(json: data!)

                         print("results users",jsonResult)
                     }
                 } catch let parseError {
                     print("JSON Error \(parseError.localizedDescription)")
                 }
              if error != nil {
                  print("Error: \(String(describing: error))")
              }
            else {

                  print("Response: \(String(describing: response))")
              }
         })

         task.resume()
    }
}
