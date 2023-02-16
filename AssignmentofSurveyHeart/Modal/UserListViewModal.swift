//
//  UserListViewModal.swift
//  AssignmentofSurveyHeart
//
//  Created by iOSnaveenG on 15/02/23.
//

import Foundation

class UserListViewModal: ObservableObject{
    
    @Published var userList:[UserData] = []
    
    func getAllUserList() async {
        
        do {
            let userList = try await WebService.getUsersList()
            DispatchQueue.main.async {
                self.userList = userList
            }
        }
        catch{
            print(error)
        }
            
    }
}
