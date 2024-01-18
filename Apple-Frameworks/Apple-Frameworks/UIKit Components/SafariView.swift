//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by 西嶋慶太郎 on 1/3/24.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
            SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
}
