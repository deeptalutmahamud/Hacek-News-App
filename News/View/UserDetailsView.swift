//
//  UserDetailsView.swift
//  Hacker News App
//
//  Created by Talut mahamud Deep on 20/5/24.
//



import SwiftUI

struct UserDetailView: View {
    let username: String
    @State private var userDetail: UserDetail?
    @State private var submittedItems = [Story]()
    @State private var imageUrl: String = "https://example.com/image.jpg"
    
    var body: some View {
        VStack {
            HStack{
                
                BackButtonView()
                Spacer()
                Text("Author Details")
                    .font(Font.custom("Oswald-Medium", size: 30))
                
                Spacer()
            }.padding()
                .padding(.top, 20)
            
            VStack{
                
                URLImageView(url: imageUrl, placeholder: "person")
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
               
                
                if let detail = userDetail {
                    
                    
                    Text("Author: \(detail.id)")
                        .font(Font.custom("Oswald-Medium", size: 22))
                        .padding()
                    
                    Text("Date: \(detail.createdDate, style: .date)")
                        .font(Font.custom("Oswald-Regular", size: 22))
                        .padding()
                    
                    Text("Karma: \(detail.karma)")
                        .font(Font.custom("Oswald-Regular", size: 22))
                        .padding()
                    
                    if let about = detail.about {
                        Text(about)
                            .font(Font.custom("Oswald-Regular", size: 22))
                            .padding()
                    }
                    
                    if !submittedItems.isEmpty {
                        
                        Text("Submitted")
                            .font(Font.custom("Oswald-Medium", size: 20))
                            .padding()
                        
                        List(submittedItems) { item in
                            NavigationLink(destination: StoryDetailView(storyID: item.id)) {
                                
                                URLImageView(url: imageUrl, placeholder: "photo.tv")
                                    .frame(width: 60, height: 60)
                                    .padding()
                                
                                Text(item.title ?? "No Title")
                                    .font(Font.custom("Oswald-Medium", size: 25))
                            }
                        }
                    } else {
                        LoaderView(isShowing: .constant(true)){
                            VStack{
                                Text("")
                            }
                            .frame(width: 400, height: 200)
                        }
                    }
                } else {
                    LoaderView(isShowing: .constant(true)){
                        VStack{
                            Text("")
                        }
                        .frame(width: 400, height: 200)
                    }
                }
            }
           
            .navigationBarBackButtonHidden(true)
            .onAppear {
                fetchUserDetail()
            }
        }}
    
    private func fetchUserDetail() {
        HackerNewsAPI().fetchUserDetail(for: username) { detail in
            if let detail = detail {
                self.userDetail = detail
                if let submittedIDs = detail.submitted {
                    fetchSubmittedItems(ids: Array(submittedIDs.prefix(10))) // Limit to top 10 submissions
                }
            }
        }
    }
    
    private func fetchSubmittedItems(ids: [Int]) {
        HackerNewsAPI().fetchSubmittedItems(for: ids) { items in
            self.submittedItems = items
        }
    }
}




#Preview {
    UserDetailView(username: "cs702")
}
