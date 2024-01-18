//
//  FollowView.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI

struct FollowView: View {
    
    var count: Int
    var title: String
    
    var body: some View {
        HStack {
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundStyle(.black)
            Text(title)
                .foregroundColor(.gray)
        }
    }
}
