//
//  NewsDetailsView.swift
//  Hacker News App
//
//  Created by Talut mahamud Deep on 20/5/24.
//

import SwiftUI

import SwiftUI

struct StoryDetailView: View {
    let storyID: Int
    @State private var storyDetail: StoryDetail?
    @State private var imageUrl: String = "https://example.com/image.jpg"
    
    var body: some View {
        VStack {
            HStack{
                BackButtonView()
                Spacer()
                Text("News Details")
                    .font(Font.custom("Oswald-Medium", size: 30))
                
                Spacer()
            }.padding()
                .padding(.top, 20)
            
            URLImageView(url: imageUrl, placeholder: "photo.tv")
                .frame(width: 200, height: 200)
                .padding()
            
            if let detail = storyDetail {
                Text(detail.title)
                    .font(Font.custom("Oswald-Medium", size: 25))
                    .padding()
                
                if let text = detail.text {
                    Text(text)
                        .font(Font.custom("Oswald-Medium", size: 25))
                        .padding()
                }
                
                HStack{
                    if let text = detail.type {
                        Text("Type: \(text)")
                            .font(Font.custom("Oswald-Medium", size: 20))
                            .padding()
                        
                       
                        
                    }
                    
                    Text("Time: \(detail.Time)")
                        .font(Font.custom("Oswald-Medium", size: 20))
                    
                }.padding()
                
                
                NavigationLink(destination: UserDetailView(username: detail.by)) {
                    Text("Author: \(detail.by)")
                        .font(Font.custom("Oswald-Medium", size: 22))
                        .foregroundColor(.green)
                        .background(RoundedRectangle(cornerRadius: 3).strokeBorder(Color.green, lineWidth: 2))
                        .padding()
                }
                
                if let urlString = detail.url, let url = URL(string: urlString) {
                    Link("Read more", destination: url)
                        .font(Font.custom("Oswald-Medium", size: 22))
                        .background(RoundedRectangle(cornerRadius: 3).strokeBorder(Color.blue, lineWidth: 2))
                        .padding()
                }
                
              
            } else {
               
                    LoaderView(isShowing: .constant(true)){
                        VStack{
                            Text("")
                        }
                        .frame(width: 400, height: 200)
                    }
              
               
            }
            Spacer()}
        .navigationBarBackButtonHidden(true)
        .onAppear {
            fetchStoryDetail()
        }
    }
    
    private func fetchStoryDetail() {
        HackerNewsAPI().fetchStoryDetail(for: storyID) { detail in
            if let detail = detail {
                self.storyDetail = detail
            }
        }
    }
}



#Preview {
    StoryDetailView(storyID: 40390201)
}
