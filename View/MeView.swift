//
//  MeView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI

struct MeView: View {
    var user = User(name: "Hello", grade: 12)
    
    @EnvironmentObject var root: RootViewModel
    
    var body: some View {
        VStack {
            Text(user.name)
                .bold()
                .font(.largeTitle)
            Divider()
            Button(action: {}) {
                Text("Log In with Google")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 5)
                    )
            }.padding()
            Spacer().onAppear {
                self.root.tabNavigationHidden = false
                self.root.tabNavigationTitle = "My Profile"
                self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "pencil.circle"))
            }
        }.padding()
    }
}
