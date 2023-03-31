//
//  WebtoonContentView.swift
//  Post-It
//
//  Created by 최효원 on 2023/03/29.
//
import SwiftUI
import AVKit

struct Content {
  //    var id: Int
  var image: Image?
  var video: AVPlayer?
  var someView: AnyView?
}

struct WebtoonContentView: View {
  
  @State var contents: [Content] = []
  @State var totalCount: Int = 0
  @State var index = 0
  @State private var showZStack = false
  
  var body: some View {
    ZStack(alignment: .bottom) {
      ZStack {
        TabView(selection: $index) {
          ForEach(0..<contents.count, id: \.self) { i in
            if let image = contents[i].image {
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .tag(i)
              
            } else if let player = contents[i].video {
              VideoPlayer(player: player)
                .aspectRatio(contentMode: .fit)
            } else if let someView = contents[i].someView {
              someView
            }
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .onAppear() {
          for i in 0...13 {
            contents.append(Content(image: Image("\(i)")))
          }
          contents.append(Content(video: AVPlayer(url: Bundle.main.url(forResource: "cake_video", withExtension: "mp4")!)))
          
          for i in 14...26{
            contents.append(Content(image: Image("\(i)")))
          }
          contents.append(Content(video: AVPlayer(url: Bundle.main.url(forResource: "last_video", withExtension: "mp4")!)))
          
          contents.append(Content(someView: AnyView(QnA1View())))
          contents.append(Content(someView: AnyView(QnA2View())))
          
          totalCount = contents.count
        }
        .onChange(of: index) { newIndex in
          pauseAllPlayers()
          if let player = contents[newIndex].video {
            player.seek(to: .zero)
            player.play()
          }
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
      
      if showZStack {
        
        ZStack {
          
          Rectangle()
            .frame(maxWidth: 1370, maxHeight: 100)
            .foregroundColor(Color.progresBackground)
          
          
          VStack(spacing: 25) {
            ProgressView((""), value: Double(index+1), total: Double(totalCount))
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
      
      
      func pauseAllPlayers() {
        for content in contents{
          if let player = content.video {
            player.pause()
          }
        }
      }
    }
  }
}

  


  
