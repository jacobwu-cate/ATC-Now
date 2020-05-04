//
//  ContactView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    let dates = [5, 6, 7, 8, 9, 10]
    let times = ["7:00", "10:00", "13:00", "16:00", "19:00"]
    
    @EnvironmentObject var root: RootViewModel
    @ObservedObject var networkDaemon = NetworkDaemon()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("May").font(.title).bold()
            ForEach(dates, id: \.self) { date in
                HStack {
                    Text(String(date))
                    Spacer()
                    ForEach(self.times, id: \.self) { time in
                        Text(time)
                            .padding(2)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .padding(.vertical, 5)
                    }
                }
            }
            Text("Chat").font(.title).bold().padding(.top, 50)
            ForEach(networkDaemon.trainers, id: \.self) { trainer in
                Button(action: {}) {
                    HStack {
                        Image(systemName: "person.fill")
                        VStack(alignment: .leading) {
                            Text(trainer.firstName + " " + trainer.lastName).font(.callout)
                            Text(trainer.title).font(.caption)
                        }
                    }
                }
            }
            Spacer().onAppear {
                self.root.tabNavigationHidden = false
                self.root.tabNavigationTitle = "Schedule Appointment"
                self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "plus.circle"))
            }
        }.padding()
    }
}
