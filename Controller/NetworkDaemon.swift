//
//  NetworkDaemon.swift
//  ATC Now!
//
//  Created by Academia on 5/4/20.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

class NetworkDaemon: ObservableObject {
    @Published var athletes = [Athlete]()
    @Published var trainers = [Trainer]()
    
    init() { // Upon initialization:
        load()
    }
    
    func load() {
        let urlA = URL(string: "https://goserver4atcapp.jacobwub.repl.co/athletes")!
        URLSession.shared.dataTask(with: urlA) { (data,response,error) in // Establish connection to specified URL
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Athlete].self, from: d) // Try to decode JSON
                    DispatchQueue.main.async {
                        self.athletes = decodedLists // Store decoded JSON as self.people
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
        }.resume()
        
        let urlT = URL(string: "https://goserver4atcapp.jacobwub.repl.co/trainers")!
        URLSession.shared.dataTask(with: urlT) { (data,response,error) in // Establish connection to specified URL
            do {
                if let d = data {
                    let decodedTables = try JSONDecoder().decode([Trainer].self, from: d) // Try to decode JSON
                    DispatchQueue.main.async {
                        self.trainers = decodedTables.sorted{$0.id < $1.id} // Store decoded JSON as self.tables
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print ("Error", error)
            }
        }.resume()
    }
}
