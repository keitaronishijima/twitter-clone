//
//  WelcomeView.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/14/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    Image("Twitter")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                    Spacer(minLength: 0)
                }
                
                Spacer(minLength: 0)
                
                Text("See what'ts happening in the world right now.")
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .frame(width: (getRect().width * 0.9), alignment: .center)
                
                Spacer(minLength: 0)
                
                VStack(alignment: .center, spacing: 10,
                       content: {
                            Button(action: {
                                print("Sign in with Google")
                            }, label: {
                                HStack(spacing: nil, content: {
                                    Image("google")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Continue with Google")
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .padding()
                                    
                                    
                                })
                                .overlay(
                                    RoundedRectangle(cornerRadius:36).stroke(Color.black, lineWidth: 1)
                                        .opacity(0.3)
                                        .frame(width: 320, height: 60, alignment: .center)
                                )
                            })
                            
                            Button(action: {
                                print("Sign in with Apple")
                            }, label: {
                                HStack(spacing: nil, content: {
                                    Image("apple")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Continue with Apple")
                                        .fontWeight(.bold)
                                        .font(.title3)
                                        .foregroundColor(.black)
                                        .padding()
                                    
                                    
                                })
                                .overlay(
                                    RoundedRectangle(cornerRadius:36).stroke(Color.black, lineWidth: 1)
                                        .opacity(0.3)
                                        .frame(width: 320, height: 60, alignment: .center)
                                )
                            })
                            
                            HStack {
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .opacity(0.3)
                                    .frame(width: (getRect().width * 0.35), height: 1)
                                
                                Text("Or")
                                
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .opacity(0.3)
                                    .frame(width: (getRect().width * 0.35), height: 1)
                                
                            }
                            NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                                        RoundedRectangle(cornerRadius: 36)
                                            .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                                            .frame(width: 320, height: 60, alignment: .center)
                                            .overlay(
                                                Text("Create account")
                                                    .fontWeight(.bold)
                                                    .font(.title3)
                                                    .foregroundStyle(.white)
                                                    .padding()
                                            )
                                    }
                    
                        }
                       
                       
                      
                       
                )
                .padding()
                
                VStack(alignment: .leading, content: {
                    VStack {
                        Text("By signing up, you agree to our")
                        +
                        Text(" Terms")
                            .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                        +
                        Text(",")
                        +
                        Text(" Privacy Policy")
                            .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                        +
                        Text(",")
                        +
                        Text(", Cookie Use")
                            .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2) {
                        Text("Have an account already? ")
                        NavigationLink(destination: LogInView().navigationBarHidden(true)) {
                            Text("Log in")
                                .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                        }
                        
                    }
                })
                
            }
            
        }
    }
}

#Preview {
    WelcomeView()
}
