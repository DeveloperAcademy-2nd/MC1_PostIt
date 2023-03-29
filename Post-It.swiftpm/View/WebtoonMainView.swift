import SwiftUI

struct WebtoonMainView: View {
  
  
  //  let sectionTitle =  "신작 매일+ 월 화 수 목 금 토 일 완결"
  @State private var selection = 1
  
  var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
  let bannerItem:[String] = ["banner1", "banner2", "banner3"]
  
  var body: some View {
    NavigationView {
      GeometryReader { geo in
        TabView(selection: $selection) {
          
          ScrollView {
            VStack(spacing: 30) {
              let w = geo.size.width
              
              TabView {
                ForEach(0..<bannerItem.count) { index in
                  Image(bannerItem[index])
                    .resizable()
                    .frame(width: w, height: 300)
                    .aspectRatio(contentMode: .fit)
                  
                }
              }
              .tabViewStyle(.page)
              .frame(width: w, height: 300)
              
              
              
              HStack(spacing: 118) {
                Text("신작")
                Text("매일+")
                Text("월")
                Text("화")
                Text("수")
                Text("목")
                Text("금")
                  .foregroundColor(Color.green)
                  .background(
                    Color.green
                      .frame(height: 2)
                      .offset(y: 20)
                  )
                Text("토")
                Text("일")
                Text("완결")
              }
              .font(.system(size: 20, weight: .semibold))
              .background(
                Color.gray
                  .opacity(0.3)
                  .frame(width:.infinity, height: 0.5)
                  .offset(y: 21)
              )
              
              
              LazyVGrid(
                columns: columns,
                pinnedViews: [],
                content: {
                  ForEach(WebtoonData, id: \.title) { index in
                    NavigationLink(
                      destination: WebtoonContentView()) {
                        VStack {
                          Image(index.image)
                            .resizable()
                            .frame(width: 200, height: 250)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                          
                          Text(index.title)
                            .font(.system(size: 19))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                          Text(index.subTitle)
                            .foregroundColor(.gray)
                            .font(.system(size:14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                          
                        }
                      }
                  }
                }
              )
              .navigationTitle("Webtoons")
              
              
            }
            
            
            
          }.tabItem {
            Image("webtoon_active")
              .resizable()
              .frame(width: 5, height: 5)
              .aspectRatio(contentMode: .fit)
            Text("웹툰")
          }.tag(1)
          
          Text("Another Tab")
            .tabItem {
              Spacer()
              Image("recommand_deActive")
              Text("추천완결")
            }
            .tag(2)
          Text("The Last Tab")
            .tabItem {
              Image("bestChallange_deActive")
              Text("배스트도전")
            }
            .tag(3)
          Text("The Last Tab")
            .tabItem {
              Image("myPage_deActive")
              Text("MY")
            }
            .tag(3)
          Text("The Last Tab")
            .tabItem {
              Image("moreInfo_deActive")
              Text("더보기")
            }
            .tag(3)
        }
        .accentColor(.black)
        .onAppear() {
          UITabBar.appearance().barTintColor = .white
          
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}




struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WebtoonMainView().previewInterfaceOrientation(.landscapeLeft)
  }
}
