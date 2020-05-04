//
//  MeView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI

struct MeView: View {
    var user = Athlete(id: "1", firstName: "Test", lastName: "User", sport: "Independent")
    
    @EnvironmentObject var root: RootViewModel
    @ObservedObject var networkDaemon = NetworkDaemon()
    
    var body: some View {
        ScrollView {
            VStack {
                Text(user.firstName + " " + user.lastName)
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
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(networkDaemon.athletes, id: \.self) { athletes in
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "person.fill")
                                    VStack(alignment: .leading) {
                                        Text(athletes.firstName + " " + athletes.lastName).font(.callout)
                                        Text(athletes.sport).font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                Spacer().onAppear {
                    self.root.tabNavigationHidden = false
                    self.root.tabNavigationTitle = "My Profile"
                    self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "pencil.circle"))
                }
            }.padding()
        }
    }
}
