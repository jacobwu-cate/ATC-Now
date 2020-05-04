//
//  HomeView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var root: RootViewModel
    var body: some View {
        VStack {
            Text("Welcome Home").font(.largeTitle)
            Text("Cate ATC").bold().font(.largeTitle)
            Image(systemName: "shield.lefthalf.fill").resizable().frame(width: 200, height: 250).onAppear {
                self.root.tabNavigationHidden = false
                self.root.tabNavigationTitle = "Welcome"
            }
        }
    }
}
