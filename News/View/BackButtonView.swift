//
//  backButtonView.swift
//  News
//
//  Created by Talut mahamud Deep on 20/5/24.
//

import SwiftUI

struct BackButtonView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   var body: some View {
       Button {
           presentationMode.wrappedValue.dismiss()
       } label: {
           Image(systemName: "arrow.backward.circle.fill")
               .resizable()
               .frame(width: 25, height: 25)
       }
   }
}


#Preview {
    BackButtonView()
}
