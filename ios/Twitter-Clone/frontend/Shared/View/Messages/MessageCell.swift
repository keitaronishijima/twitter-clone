//
//  MessageCell.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI

struct MessageCell: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack (alignment: .leading, spacing: nil) {
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundStyle(.gray)
                .opacity(0.3)
            
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Cem ")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        
                        Text("@cem_salta")
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text("6/20/21")
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    
                    Text("You: How is it going?")
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                }
                .padding(.top, 2)
            }
            .frame(width: width, height: 84)
        }
    }
}

#Preview {
    MessageCell()
}
