//
//  MeView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI
import AVKit

struct MeView: View {
    @EnvironmentObject var root: RootViewModel
    @ObservedObject var networkDaemon = NetworkDaemon()
    @State var showingDetail = false // Controls whether a popup view is displayed
    @State var showingError = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Button(action: {
                        self.showingError = true
                    }) {
                        Text("Log In with Google")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 5)
                        )
                    }.padding().alert(isPresented: $showingError) {
                        Alert(title: Text("Functionality under construction"), message: Text("Check back later for updates"), dismissButton: .default(Text("OK")) {})
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            ForEach(networkDaemon.athletes, id: \.self) { athletes in
                                Button(action: {
                                    self.showingDetail.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: "person.fill")
                                        VStack(alignment: .leading) {
                                            Text(athletes.firstName + " " + athletes.lastName).font(.callout)
                                            Text(athletes.sport).font(.caption)
                                        }
                                    }
                                }.sheet(isPresented: self.$showingDetail) {
                                    DetailUserView(withInfo: athletes)
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
                }
            }.padding().navigationBarTitle(Text("Users"))
        }
    }
}

struct DetailUserView: View { // Popup person information
    @Environment(\.presentationMode) var presentationMode
    var withInfo: Athlete
    
    var body: some View {
        NavigationView {
            ZStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {Color(.clear)} // Click any white space to dismiss sheet
                VStack{
                    Text(withInfo.firstName + " " + withInfo.lastName).font(.largeTitle)
                    Text("Sport: \(withInfo.sport)").font(.headline)
                    Spacer()
                    Text("Assigned Training Programs: \(withInfo.assigned)").font(.subheadline)
                    ForEach(withInfo.assigned.components(separatedBy: ","), id:\.self) { program in
                        NavigationLink(destination: PlayerView(index: String(program))) {
                            HStack {
                                Image(systemName: "\(String(program)).circle.fill")
                                Text("Training \(String(program))")
                            }
                        }
                    }
                    Spacer()
                }.padding(.top, 100)
            }
        }
    }
}
