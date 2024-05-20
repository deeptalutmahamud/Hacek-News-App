//
//  ContentView.swift
//  News
//
//  Created by Talut mahamud Deep on 16/5/24.
//

import SwiftUI

import SwiftUI
import SDWebImageSwiftUI

struct URLImageView: View {
    var url: String
    var placeholder : String

    var body: some View {
        VStack {
            if let imageURL = URL(string: url) {
                WebImage(url: imageURL)
                    .resizable()
                    .placeholder {
                        // Placeholder image while loading
                        Image(systemName: placeholder)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    }
                    .indicator(.activity) // Activity Indicator while loading
                    .transition(.fade(duration: 0.5)) // Fade transition
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } else {
                // Fallback if URL is invalid
                Image(systemName: placeholder)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView: View {
    @State private var imageUrl: String = "https://example.com/image.jpg"

    var body: some View {
        URLImageView(url: imageUrl, placeholder: "photo.tv")
    }
}



#Preview {
    ContentView()
}
