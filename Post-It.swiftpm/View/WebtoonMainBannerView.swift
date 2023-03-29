//
//  File.swift
//  
//
//  Created by 최효원 on 2023/03/29.
//

import SwiftUI


//struct WebtoonMainBannerView: View {
//    
//    let items: [ItemModel]
//    
//    @State var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//    @State var currentImage: String?
//    @State private var currentIndex = 0 {
//        didSet {
//            scrollToCurrentPage()
//            withAnimation(.easeInOut) {
//                currentImage = items[currentIndex].image
//            }
//        }
//    }
//    @State private var contentOffsetX: CGFloat = 0
//    @State private var titleViewWidth: CGFloat = 0
//    let spacing: CGFloat = 10
//    
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .bottom) {
//                ZStack(alignment: .bottom) {
//                    Image(currentImage ?? "")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: geometry.size.width, height: geometry.size.width * 0.8)
//                        .clipped()
//                    LinearGradient(colors: [.white, .clear], startPoint: .bottom, endPoint: .top)
//                        .frame(height: 50)
//                }
//                VStack(alignment: .trailing) {
//                    Text("\(currentIndex+1)/\(items.count)")
//                        .padding(.horizontal, 6)
//                        .background(Color.white.opacity(0.4))
//                        .cornerRadius(10)
//                        .padding(.trailing, 20)
//                        .foregroundColor(.white)
//                        .font(.system(size: 14, weight: .bold))
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: spacing) {
//                            Group {
//                                ForEach(-1..<items.count + 1, id: \.self) { i in
//                                    CarouselTitleView(item: items[i < 0 ? items.count - 1 : (i >= items.count ? 0 : i)])
//                                    .frame(width: titleViewWidth)
//                                    
//                                }
//                            }
//                        }
//                        .offset(x: contentOffsetX, y: 0)
//                    } //: ScrollView
//                    .scrollDisabled(true)
//                }
//            } //: ZStack
//            .gesture(
//                DragGesture()
//                    .onEnded { value in
//                        if value.translation.width < 0 {
//                            currentIndex += 1
//                        } else if value.translation.width > 0 {
//                            currentIndex -= 1
//                        }
//                        timer.upstream.connect().cancel()
//                        timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//                    }
//            )
//            .onAppear {
//                currentImage = items[0].image
//                titleViewWidth = geometry.size.width - 40
//                contentOffsetX = -titleViewWidth + spacing
//            }
//            .onReceive(timer) { _ in
//                currentIndex += 1
//            }
//        } //: GeometryReader
//    }
//    
//    private func scrollToCurrentPage() {
//        if currentIndex == items.count {
//            contentOffsetX = 0
//            currentIndex = 0
//        } else if currentIndex < 0 {
//          contentOffsetX = -titleViewWidth * CGFloat(items.count+1) + spacing * CGFloat(items.count - 1)
//                     currentIndex = items.count - 1
//                 }
//
//                 withAnimation {
//                     contentOffsetX = -titleViewWidth * CGFloat(currentIndex+1) - spacing * CGFloat(currentIndex - 1)
//                 }
//             }
//         }
//
//
//
//struct BannerView_Preview: PreviewProvider {
//  static var previews: some View {
//    WebtoonMainBannerView().previewInterfaceOrientation(.landscapeLeft)
//  }
//}

