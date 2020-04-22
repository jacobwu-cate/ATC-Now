//
//  RootView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var model = RootViewModel()
    
    // Instantiating them with `let` to preserve structure and data
    let homeView = HomeView()
    let contactView = ContactView()
    let meView = MeView()
    
    var body: some View {
        NavigationView {
            TabView(selection: $model.tabSelection) {
                homeView
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                }
                .tag(0)
                contactView
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Contact")
                }
                .tag(1)
                meView
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Me")
                }
                .tag(2)
            }
                .accentColor(.blue) // 选中某个 Tab 时，Item 的高亮颜色
                .navigationBarHidden(model.tabNavigationHidden)
                .navigationBarItems(trailing: model.tabNavigationBarTrailingItems)
                .navigationBarTitle(model.tabNavigationTitle, displayMode: .inline)
                .environmentObject(model)
        }
    }
}

struct RootTabView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
