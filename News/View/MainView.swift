//
//  ContentView.swift
//  Hacker News App
//
//  Created by Talut mahamud Deep on 20/5/24.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    @ObservedObject var hackerNewsAPI = HackerNewsAPI()
    @State private var selectedCategory: StoryCategory = .topStories
    @State private var imageUrl: String = "https://example.com/image.jpg"
    
    var body: some View {
        
        LoaderView(isShowing: .constant(self.hackerNewsAPI.isLoading)){
        NavigationView {
            VStack {
                HStack{
                    
                    Spacer()
                    Text("Hacker News")
                        .font(Font.custom("Jacquard12-Regular", size: 40))
                    
                    Spacer()
                }
                
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(StoryCategory.allCases) { category in
                        Text(category.displayName).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .frame(height: 60) // Adjust the height here
                
                List(hackerNewsAPI.stories) { story in
                    NavigationLink(destination: StoryDetailView(storyID: story.id)) {
                        
                        URLImageView(url: imageUrl, placeholder: "photo.tv")
                            .frame(width: 60, height: 60)
                            .padding()
                        
                        Text(story.title)
                            .font(Font.custom("Oswald-Medium", size: 25))
                            .padding()
                    }
                }
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    hackerNewsAPI.fetchStories(for: .topStories)
                }
                .onChange(of: selectedCategory) { newCategory in
                    hackerNewsAPI.fetchStories(for: newCategory)
                }
            }
        }}
    }
}



#Preview {
    MainView()
}
