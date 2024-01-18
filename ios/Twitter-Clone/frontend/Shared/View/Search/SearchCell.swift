//
//  SearchCell.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI

struct SearchCell: View {
    
    var tag = ""
    var tweets = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Text("hello")
                .fontWeight(.heavy)
            Text(tweets + " Tweets")
                .fontWeight(.light)

        })
    }
}

#Preview {
    SearchCell()
}
