//
//  ContentView.swift
//  ModelBootcamp
//
//  Created by Bishowjit Ray on 23/9/22.
//

import SwiftUI

struct UserModel: Identifiable  {
    let id: String = UUID().uuidString
    let displayname: String
    let  userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ContentView: View {
    
    @State var users: [UserModel] = [
    
    //"Nick","Emily","Samanta","Chris"
    
        UserModel(displayname: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayname: "Emily", userName: "Emily43123", followerCount: 55, isVerified: false),
        UserModel(displayname: "Samantha", userName: "ninja", followerCount: 354, isVerified: false),
        UserModel(displayname: "Chiris", userName: "chiris43" , followerCount: 88, isVerified: true)
    ]
  
    var body: some View {
        NavigationView{
            List{
                ForEach(users) { user   in
                    HStack {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayname)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        if user.isVerified{
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(Color.green)
                        }
                        
                       
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                            
                        }
                    }
                    .padding(.vertical, 20)
                }
            
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("User")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

