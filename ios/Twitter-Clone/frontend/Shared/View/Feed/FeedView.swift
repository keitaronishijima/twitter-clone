//
//  Feed.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/13/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false,
                   content: {
            VStack(spacing: 18) {
                TweetCellView(tweet: sampleText, tweetImage: "post")
                Divider()
                ForEach(1...20, id: \.self) {  _ in
                    TweetCellView(tweet: sampleText)
                    Divider()
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        })
    }
}

#Preview {
    FeedView()
}
