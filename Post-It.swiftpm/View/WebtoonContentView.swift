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
//    @State var idxRange: [Int] = []
//    let images = [Image("#1"), Image("#2")]
    
    @State var index = 0
    
    var body: some View {
        
        VStack {
//            Text(idxRange.description)
//                .font(.largeTitle)
            TabView(selection: $index) {
                ForEach(0..<contents.count, id: \.self) { i in
                    if let image = contents[i].image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if let player = contents[i].video {
                        VideoPlayer(player: player)
                            .scaledToFit()
                    } else if let someView = contents[i].someView {
                        someView
                    }
                }
                //                QnA1View()
                //                Image("#1")
                //                ForEach(0..<5, id: \.self) {i in
                //                    if let image = contents[i].image {
                //                        image
                //                            .resizable()
                //                            .scaledToFit()
                //                        //                            .tag(i)
                //                    } else if let player = contents[i].video {
                //                        VideoPlayer(player: player)
                //                            .scaledToFit()
                //                            .tag(i)
                //                    } else if let aView = contents[i].aView {
                //                        aView
                //                            .tag(i)
                //                    }
                //                    images[i]
                //                        .resizable()
                //                        .scaledToFit()
                //                        .tag(i)
                //                }
                //                VideoPlayer(player: videos[0])
                //                    .scaledToFit()
                //                    .tag(4)
                //                VideoPlayer(player: videos[1])
                //                    .scaledToFit()
                //                    .tag(5)
                //                VideoPlayer(player: videos[2])
                //                    .scaledToFit()
                //                    .tag(6)
                //                images[1]
                //                    .resizable()
                //                    .scaledToFit()
                //                    .tag(7)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            //                .tabViewStyle(.page)
            .ignoresSafeArea()
            .onAppear() {
//                print("before function contents: \(contents)")
                
                for i in 0...3 {
                    contents.append(Content(image: Image("#\(i)")))
                }
                contents.append(Content(video: AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)))
                contents.append(Content(video: AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)))
                contents.append(Content(someView: AnyView(Sample1View())))
                contents.append(Content(someView: AnyView(Sample2View())))
                
                totalCount = contents.count
                
//                print("after function contents: \(contents)")
            }
            .onChange(of: index) { newIndex in
                pauseAllPlayers()
                if let player = contents[newIndex].video {
                    player.seek(to: .zero)
                    player.play()
                }
            }
        }
        ProgressView((""), value: Double(index+1), total: Double(totalCount))
    }
    //        .onAppear {
    //            self.totalCount = contents.count
    //
    //        }
    func pauseAllPlayers() {
        for content in contents{
            if let player = content.video {
                player.pause()
            }
        }
    }
}

//    init()  {
//        let player0 = AVPlayer(url: Bundle.main.url(forResource: "cake", withExtension: "mp4")!)
//        let player1 = AVPlayer(url: Bundle.main.url(forResource: "chair", withExtension: "mp4")!)
//        let player2 = AVPlayer(url: Bundle.main.url(forResource: "cake2", withExtension: "mp4")!)
//
//        //        self.images = []
//        //        self.videos = [player0, player1, player2]
//        var contents: [Content] = []
//        for i in 0...3 {
//            contents.append(Content(image: Image("#\(i)")))
//        }
//        contents.append(Content(video: player0))
//        contents.append(Content(video: player1))
//        contents.append(Content(video: player2))
//
//        print(contents)
////        contents.append(Content(aView: AnyView(Sample1View())))
////        contents.append()
//
//        self.contents = contents
//        //        for i in 0...3 {
//        //            self.images.append(Image("#\(i)"))
//        //        }
//    }

//}

//struct TabItemView: View {
//    let content: View
//    var body: some View {
//        content
//    }
//}

struct Sample1View: View {
    var body: some View {
        Text("Sample1")
            .font(.largeTitle)
    }
}

struct Sample2View: View {
    var body: some View {
        Text("Sample2")
            .font(.largeTitle)
    }
}

struct WebtoonContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebtoonContentView()
    }
}

struct WebtoonContentView_Previews_Landscape: PreviewProvider {
    static var previews: some View {
        WebtoonContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
