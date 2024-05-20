//
//  Loader.swift
//  News
//
//  Created by Talut mahamud Deep on 21/5/24.
//

import SwiftUI
import SSSwiftUIGIFView

struct LoaderView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
           
                ZStack(alignment: .center) {
                    self.content()
                        .disabled(self.isShowing)
                        
                       
                    ZStack {
                        SwiftUIGIFPlayerView(gifName: "loading") .frame(width: 200,height: 200)
                        //UrbanistMediumTextView(text: "", fontSize: 15, colorName: "191B32")
                    }.opacity(self.isShowing ? 1 : 0)
                        .padding(15)
                        .background(self.isShowing ? Color.white.opacity(0) : Color.clear)
                        .cornerRadius(65)
                    
                    
                }
                //.padding(.top, -40)
            
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            .background(Color.black.opacity(0.3))
//            .ignoresSafeArea()
        }
        
    }
        
}





#Preview {
    LoaderView(isShowing: .constant(true)){
        VStack{
            Text("")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
    }
}
