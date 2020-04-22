//
//  ContactView.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    let dates = [22, 23, 24, 25, 26]
    let times = ["10:00", "3:00", "5:00"]
    let ATs = ["Shannon", "Kyle", "Wade"]
    @EnvironmentObject var root: RootViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("April").font(.title).bold()
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
            ForEach(ATs, id: \.self) { at in
                Button(action: {}) {
                    Image(systemName: "person.fill")
                    Text(at)
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
