//
//  TopBar.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI

struct TopBar: View {
    
    @Binding var x: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        x = 0
                    }
                    
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundStyle(Color("bg"))
                })
                
                Spacer(minLength: 0)
                
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundStyle(.gray)
                .opacity(0.3)
                
        }
        .background(Color.white)
    }
}

//#Preview {
//    TopBar()
//}
