//
//  SearchUserCell.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            
            VStack (alignment: .leading) {
                Text("Cem")
                    .fontWeight(.heavy)
                Text("@cem_salta")
            }
            
            Spacer(minLength: 0)
            
            
        }
    }
}

#Preview {
    SearchUserCell()
}
