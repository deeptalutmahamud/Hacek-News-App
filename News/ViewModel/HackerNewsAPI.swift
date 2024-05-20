//
//  ViewModel.swift
//  Hacker News App
//
//  Created by Talut mahamud Deep on 20/5/24.
//

import Alamofire
import SwiftUI

class HackerNewsAPI: ObservableObject {
    @Published var stories = [Story]()
    @Published var isLoading:Bool = false
    
    private let baseURL = "https://hacker-news.firebaseio.com/v0"
    
    func fetchStories(for category: StoryCategory) {
        self.isLoading = true
        let url = "\(baseURL)/\(category.rawValue).json"
        
        AF.request(url).responseDecodable(of: [Int].self) { response in
            self.isLoading = false
            switch response.result {
            case .success(let storyIDs):
                self.fetchDetails(for: storyIDs.prefix(10)) // Fetch top 10 stories
            case .failure(let error):
                print("Error fetching \(category.rawValue): \(error)")
            }
        }
    }
    
    private func fetchDetails(for ids: ArraySlice<Int>) {
        self.isLoading = true
        let group = DispatchGroup()
        var stories = [Story]()
        
        for id in ids {
            group.enter()
            let itemURL = "\(baseURL)/item/\(id).json"
            
            AF.request(itemURL).responseDecodable(of: Story.self) { response in
                self.isLoading = false
                defer { group.leave() }
                switch response.result {
                case .success(let story):
                    DispatchQueue.main.async {
                        stories.append(story)
                    }
                case .failure(let error):
                    print("Error fetching story \(id): \(error)")
                }
            }
        }
        
        group.notify(queue: .main) {
            self.stories = stories
        }
    }
    
    func fetchStoryDetail(for id: Int, completion: @escaping (StoryDetail?) -> Void) {
        self.isLoading = true
        let itemURL = "\(baseURL)/item/\(id).json"
        
        AF.request(itemURL).responseDecodable(of: StoryDetail.self) { response in
            self.isLoading = false
            switch response.result {
            case .success(let storyDetail):
                completion(storyDetail)
            case .failure(let error):
                print("Error fetching story detail \(id): \(error)")
                completion(nil)
            }
        }
    }
    
    func fetchUserDetail(for username: String, completion: @escaping (UserDetail?) -> Void) {
        self.isLoading = true
        let userURL = "\(baseURL)/user/\(username).json"
        
        AF.request(userURL).responseDecodable(of: UserDetail.self) { response in
            self.isLoading = false
            switch response.result {
            case .success(let userDetail):
                completion(userDetail)
            case .failure(let error):
                print("Error fetching user detail \(username): \(error)")
                completion(nil)
            }
        }
    }
    
    func fetchSubmittedItems(for ids: [Int], completion: @escaping ([Story]) -> Void) {
        self.isLoading = true
        let group = DispatchGroup()
        var items = [Story]()
        
        for id in ids {
            group.enter()
            let itemURL = "\(baseURL)/item/\(id).json"
            
            AF.request(itemURL).responseDecodable(of: Story.self) { response in
                self.isLoading = false
                defer { group.leave() }
                switch response.result {
                case .success(let item):
                    DispatchQueue.main.async {
                        items.append(item)
                    }
                case .failure(let error):
                    print("Error fetching item \(id): \(error)")
                }
            }
        }
        
        group.notify(queue: .main) {
            completion(items)
        }
    }
}
