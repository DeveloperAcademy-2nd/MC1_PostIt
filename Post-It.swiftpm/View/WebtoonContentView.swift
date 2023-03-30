//
//  WebtoonContentView.swift
//  Post-It
//
//  Created by 최효원 on 2023/03/29.
//

import SwiftUI
import AVKit

struct WebtoonContentView: View {
      
  var images: [Image]
  
  @State var index = 0
  @State private var showZStack = false
  @StateObject var playerController = AVPlayerController()

  var body: some View {
    ZStack(alignment: .bottom) {
      ZStack {
        TabView(selection: $index) {
          ForEach(0 ..< 25) { i in
            if (i != 4) && (i != 5) && (i != 6)  {
              images[i]
                .resizable()
                .scaledToFill()
                .tag(i)

            } else {
              VideoPlayer(player: playerController.players[i])
                .scaledToFill()
                .tag(i)
            }
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .onChange(of: index) { newIndex in

          switch newIndex {
          case 4:
            playerController.play(index: 4)
          case 5:
            playerController.play(index: 5)
          case 6:
            playerController.play(index: 6)
          default:
            playerController.pauseAll()
          }
        }
        HStack {
          Button(action: {
            index = (index - 1) % 24
          }, label : {
            Rectangle()
          })
          .frame(width: 400, height : 930)
          .foregroundColor(Color.clear)

          Button(action: {
            showZStack.toggle()

          }, label:  {
            Rectangle()
          })
          .frame(width: 700, height: 930, alignment: .leading)
          .foregroundColor(Color.clear)

          Button(action: {
            index = (index + 1) % 24
          }, label : {
            Rectangle()
          })
          .frame(width: 400, height : 930)
          .foregroundColor(Color.clear)
        }
      }
      if showZStack {

          ZStack {
             
              Rectangle()
                .frame(maxWidth: 1370, maxHeight: 100)
                .foregroundColor(Color.progresBackground)
            

            VStack(spacing: 25) {
              ProgressView((""), value: Double(index+1), total: Double(25))
              HStack {
                Image(systemName: "heart")
                  .resizable()
                  .frame(width: 20, height: 20)
                  .padding(.leading, 20)
                Text("9,999+")
                  .padding(.trailing, 10)
                Image(systemName: "ellipsis.bubble.fill")
                  .resizable()
                  .frame(width: 20, height: 20)
                Text("15,489")
                Spacer()
                Image(systemName: "arrowtriangle.backward.fill")
                  .resizable()
                  .frame(width: 15, height: 15)
                Image(systemName: "list.bullet")
                  .resizable()
                  .frame(width: 20, height: 16)
                  .padding([.leading, .trailing], 10)
                Image(systemName: "arrowtriangle.right.fill")
                  .resizable()
                  .frame(width: 15, height: 15)
                  .padding(.trailing, 20)

              }.foregroundColor(.white)
            }
          }
          .frame(maxWidth: 1370 , maxHeight: 100)
          .edgesIgnoringSafeArea(.all)

        }

    }.ignoresSafeArea(.all)
  }


  func pauseAllPlayers() {
    playerController.pauseAll()
  }
  
  static func makeWebtoonContentView() -> WebtoonContentView {
    let images = (0..<25).map { Image("image\($0)") }
    let playerController = AVPlayerController()
    let player0 = AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)
    let player1 = AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)
    let player2 = AVPlayer(url: Bundle.main.url(forResource: "cake2", withExtension: "mp4")!)

    playerController.players[4] = player0
    playerController.players[5] = player1
    playerController.players[6] = player2
    
    return WebtoonContentView(images: images, playerController: playerController)
  }
}

class AVPlayerController: ObservableObject {
  @Published var players: [AVPlayer] = Array(repeating: AVPlayer(), count: 7)

  func play(index: Int) {
    pauseAll()
    players[index].seek(to: .zero)
    players[index].play()
  }
  
  func pauseAll() {
    for player in players {
      player.pause()
    }
  }
}
