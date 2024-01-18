//
//  NotificationsView.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/13/24.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {  
            ScrollView {
                ForEach(0..<9) { _ in
                    NotificationCell()
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
