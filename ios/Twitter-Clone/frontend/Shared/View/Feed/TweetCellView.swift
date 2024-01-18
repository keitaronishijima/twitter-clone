//
//  TweetCellView.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/13/24.
//

import SwiftUI

struct TweetCellView: View {
    
    var tweet: String
    var tweetImage: String?
    
    var body: some View {
        VStack {
            HStack(alignment: .top, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10, content: {
                    (Text ("Cem ")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    + Text("@cem_salta")
                        .foregroundStyle(.gray))
                    Text(tweet)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if let image = tweetImage {
                        GeometryReader { proxy in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode:
                                        .fill)
                                .frame(width: proxy.frame(in:.global).width, height:  250)
                            .cornerRadius(15)}
                        .frame(height: 250)
                    }
                })
            })
            
            HStack(spacing: 50, content: {
                Button(action: {
                    
                }, label: {
                    Image("Comments")
                        .resizable()
                        .frame(width: 16, height: 16)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image("Retweet")
                        .resizable()
                        .frame(width: 18, height: 14)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image("love")
                        .resizable()
                        .frame(width: 18, height: 14)
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image("upload")
                        .resizable()
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .frame(width: 18, height: 15)
                }).foregroundColor(.gray)
            })
            .padding(.top, 4)
        }
    }
}

#Preview {
    TweetCellView(tweet: sampleText)
}


var sampleText = "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying"
