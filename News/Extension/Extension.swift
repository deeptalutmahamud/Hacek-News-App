//
//  Extension.swift
//  Hacker News App
//
//  Created by Talut mahamud Deep on 20/5/24.
//

enum StoryCategory: String, CaseIterable, Identifiable {
    case topStories = "topstories"
    case newStories = "newstories"
    case bestStories = "beststories"
    case jobStories = "jobstories"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .topStories: return "Top Stories"
        case .newStories: return "New Stories"
        case .bestStories: return "Best Stories"
        case .jobStories: return "Job Stories"
        }
    }
}

