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
    
    /// 标签栏界面导航右侧按钮
    @Published var tabNavigationBarTrailingItems: AnyView = .init(EmptyView())
    
}
