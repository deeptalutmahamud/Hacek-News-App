//
//  Model.swift
//  Hacker News App
//
//  Created by Talut mahamud Deep on 20/5/24.
//

import Foundation


struct Story: Identifiable, Codable {
    let id: Int
    let title: String
    let url: String?
}

struct StoryDetail: Identifiable, Codable {
    let id: Int
    let title: String
    let url: String?
    let text: String?
    let by: String
    let time: Int
    let type : String?
    
    var Time: String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "h:mm a"
           let date = Date(timeIntervalSince1970: TimeInterval(time))
           return dateFormatter.string(from: date)
       }
}

struct UserDetail: Identifiable, Codable {
    let id: String
    let created: Int
    let karma: Int
    let about: String?
    let submitted: [Int]?
    
    var createdDate: Date {
        Date(timeIntervalSince1970: TimeInterval(created))
    }
}
