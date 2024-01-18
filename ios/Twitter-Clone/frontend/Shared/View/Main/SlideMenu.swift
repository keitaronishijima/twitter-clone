//
//  SlideMenu.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI


struct SlideMenu: View {
    
    @State var show = false
    
    var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Image("logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    HStack(alignment: .top, spacing: 12) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Cem")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("@cem_salta")
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 20) {
                                FollowView(count: 8, title: "Following")
                                FollowView(count: 16, title: "Followers")
                            }
                            .padding(.top, 10)
                            Divider()
                                .padding(.top, 10)
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }, label: {
                            Image(systemName: show ? "chevron.down" : "chevron.up")
                                .foregroundColor(Color("bg"))
                        })
                        
                    }
                    
                    VStack(alignment: .leading) {
                        ForEach(menuButtons, id:\.self) { item in
                            MenuButton(title: item)
                        }
                        
                        Divider()
                            .padding(.top)
                        
                        Button(action: {
                            
                        }, label: {
                            MenuButton(title: "Twitter Ads")
                        })
                        
                        Divider()
                            .padding(.top)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Settings and privacy")
                                .foregroundStyle(.black)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Help center")
                                .foregroundStyle(.black)
                        })
                        
                        Spacer(minLength: 0)
                        
                        Divider()
                            .padding(.bottom)
                        
                        HStack {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("help")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundStyle(Color("bg"))
                            })
                            
                            Spacer(minLength: 0)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("barcode")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundStyle(Color("bg"))
                            })
                        }
                    
                    }
                    .opacity(show ? 1 : 0)
                    .frame(height: show ? nil : 0)
                    
                    VStack(alignment: .leading) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Create a new account")
                                .foregroundColor(Color("bg"))
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add a existing account")
                                .foregroundColor(Color("bg"))
                        })
                        
                        Spacer(minLength: 0)
                    }
                    .opacity(show ? 0 : 1)
                    .frame(height: !show ? nil : 0)
                    
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, edges!.top == 0 ? 15 : edges?.top)
                .padding(.bottom, edges!.bottom == 0 ? 15 : edges?.bottom)
                .frame(width: width - 90)
                .background(Color.white)
                .ignoresSafeArea(.all, edges: .vertical)
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    SlideMenu()
}
