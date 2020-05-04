//
//  ExerciseView.swift
//  ATC Now!
//
//  Created by Academia on 4/27/20.
//  Copyright © 2020 JW. All rights reserved.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    
    @EnvironmentObject var root: RootViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Training").font(.title).bold()
                Spacer()
            }
            ForEach(1..<20) { index in
                NavigationLink(destination: PlayerView(index: String(index))) {
                    HStack {
                        Image(systemName: "\(String(index)).circle.fill")
                        Text("Training \(String(index))")
                    }
                }
            }
            Spacer().onAppear {
                self.root.tabNavigationHidden = false
                self.root.tabNavigationTitle = "Get Exercising"
                self.root.tabNavigationBarTrailingItems = .init(Image(systemName: "plus.circle"))
            }
        }.padding()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}

struct PlayerView: UIViewRepresentable {
    var index: String
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, index: index)
    }
} // CITE: https://medium.com/flawless-app-stories/avplayer-swiftui-b87af6d0553

class PlayerUIView: UIView {
    var index: String
    private let playerLayer = AVPlayerLayer()
    init(frame: CGRect, index: String) {
        self.index = index
        super.init(frame: frame)
        
        let url = URL(string: "https://videoserver4atcapp.jacobwub.repl.co/vid" + self.index + ".mp4")!
        let player = AVPlayer(url: url)
        player.play()
        
        playerLayer.player = player
        layer.addSublayer(playerLayer)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
} // CITE: https://medium.com/flawless-app-stories/avplayer-swiftui-b87af6d0553

