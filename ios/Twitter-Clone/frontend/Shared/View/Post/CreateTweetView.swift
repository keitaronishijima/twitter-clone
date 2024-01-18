//
//  CreateTweetView.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/13/24.
//

import SwiftUI

struct CreateTweetView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Tweet").padding()
                })
                .background(Color("bg"))
                .foregroundStyle(.white)
                .clipShape(Capsule())
            }
            
            MultilineTextField(text: $text)
//            TextField("write something", text: $text, axis: .vertical)
//
//                        .textFieldStyle(.roundedBorder)
//                        .padding()
        }
        .padding()
    }
}

#Preview {
    CreateTweetView()
}
