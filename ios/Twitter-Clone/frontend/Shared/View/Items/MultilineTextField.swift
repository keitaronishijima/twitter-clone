//
//  MultilineTextField.swift
//  Twitter-Clone
//
//  Created by 西嶋慶太郎 on 1/13/24.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> MultilineTextField.Coordinator {
        return MultilineTextField.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> some UITextView {
        let text = UITextView()
        text.isEditable = true
        text.text = "Type something"
        text.isUserInteractionEnabled = true
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
            
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextField
        
        init(parent1: MultilineTextField) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
