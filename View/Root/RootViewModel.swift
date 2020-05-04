//
//  RootViewModel.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import Combine
import SwiftUI

class RootViewModel: ObservableObject {
    @Published var tabSelection: Int = 0
    @Published var tabNavigationHidden: Bool = false
    @Published var tabNavigationTitle: LocalizedStringKey = ""
    
    /// Buttons to the right of the navigation bar
    @Published var tabNavigationBarTrailingItems: AnyView = .init(EmptyView())
    
}
