//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by 西嶋慶太郎 on 1/3/24.
//

import Foundation
import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
}
