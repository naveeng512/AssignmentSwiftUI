//
//  ContentView.swift
//  AssignmentofSurveyHeart
//
//  Created by iOSnaveenG on 14/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var useListVM = UserListViewModal()
    
    @State var searchResultsList = [UserData]()
    
    @State private var searchText:String = ""

    var body: some View {
        NavigationView{
            List {
                ForEach(searchResultsList, id: \.email){userData in
                    
                    HStack(spacing: 4){
                        AsyncImage(url: URL(string: userData.picture.large)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .cornerRadius(24.0)
                        Button(action: {})
                        {
                            Text(" \(userData.name.title). \(userData.name.first) \(userData.name.last)").font(.custom(AppConstants.titleFont, size: AppConstants.titleFontSize))
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        .foregroundColor(.black)
                        NavigationLink(destination: UserDetailView(userDetails: userData)) {
                            Text(verbatim: "")
                        }
                    }
                  
                }
            }.onAppear{
                Task{
                    await useListVM.getAllUserList()
                    self.searchResultsList = useListVM.userList
                }
            }
            .navigationTitle(AppConstants.navigationTitle)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: AppConstants.searchPlaceholder)
        .onChange(of: searchText) { index in
            if !index.isEmpty{
                searchResultsList = useListVM.userList.filter { $0.name.first.contains(searchText) || $0.name.last.contains(searchText) || $0.name.title.contains(searchText) || $0.gender.contains(searchText)}
            }else{
                searchResultsList = useListVM.userList
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
