//
//  Home.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/13/24.
//

import SwiftUI

struct Home: View {
    
    @State var selectedIndex = 0
    @State var showCreateTweet = false
    @State var text = ""
    
    var body: some View {
        VStack {
            ZStack {
                
                TabView {
                    FeedView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            if (selectedIndex == 0) {
                                Image("Home")
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(Color("bg"))
                            } else {
                                Image("Home")
                            }
                        }
                        .tag(0)
                    SearchView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            if (selectedIndex != 1) {
                                Image("Search")
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(Color("bg"))
                            } else {
                                Image("Search")
                            }
                        }
                        .tag(1)
                    
                    NotificationsView()
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .tabItem {
                            if (selectedIndex != 2) {
                                Image("Notifications")
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(Color("bg"))
                            } else {
                                Image("Notifications")
                            }
                        }
                        .tag(2)
                    
                    
                    MessagesView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .tabItem {
                            if (selectedIndex != 3) {
                                Image("Messages")
                                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(Color("bg"))
                            } else {
                                Image("Messages")
                            }
                        }
                        .tag(3)
                }
                
                VStack{
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showCreateTweet.toggle()
                        }, label: {
                            Image("tweet").renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .foregroundStyle(.white)
                                .background(Color("bg"))
                                .clipShape(Circle())
                        })
                    }
                    .padding()
                }
                .padding(.bottom, 65)
            }
            .sheet(isPresented: $showCreateTweet, content: {
                CreateTweetView(text: text)
            })
        }
    }
}

#Preview {
    Home()
}
