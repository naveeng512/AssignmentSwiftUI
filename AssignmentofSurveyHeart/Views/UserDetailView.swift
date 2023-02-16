//
//  UserDetailView.swift
//  AssignmentofSurveyHeart
//
//  Created by iOSnaveenG on 16/02/23.
//

import SwiftUI

struct UserDetailView: View {
    var userDetails: UserData
    
    var body: some View {
        
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: userDetails.picture.large)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 300)
            .cornerRadius(24.0)
            Spacer()

            VStack(alignment: .leading, spacing: 20) {
                Text("Name: \(userDetails.name.title). \(userDetails.name.first) \(userDetails.name.last)").font(.custom(AppConstants.detailTitleFont, size: AppConstants.detailTFontSize))
                Text("Email: \(userDetails.email)").font(.custom(AppConstants.detailTitleFont, size: AppConstants.detailTFontSize))
                Text("Gender: \(userDetails.gender)").font(.custom(AppConstants.detailTitleFont, size: AppConstants.detailTFontSize))
                Text("Cell Number: \(userDetails.cell)").font(.custom(AppConstants.detailTitleFont, size: AppConstants.detailTFontSize))
          }
            Spacer()
        }
        .padding()
               .background {
                   RoundedRectangle(cornerRadius: 15, style: .continuous)
                       .fill(Color.init(uiColor: .systemGray5))
               }
               .cornerRadius(15)
               .shadow(color: .indigo, radius: 3, x: -2, y: 2)

        .navigationBarTitle(Text(" \(userDetails.name.title). \(userDetails.name.first) \(userDetails.name.last)"), displayMode: .inline)

    }
}

struct UserDetailView_Previews: PreviewProvider {
    
    static let userPreview = UserData(
        gender: "",
        email: "",
        cell: "",
        name: name.init(title: "", first: "", last: ""),
        picture: picture.init(large: "", medium: "", thumbnail: "")
    )
    
    static var previews: some View {
        UserDetailView(userDetails: userPreview)
    }
}
