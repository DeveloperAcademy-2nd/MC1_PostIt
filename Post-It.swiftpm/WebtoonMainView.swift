import SwiftUI

struct WebtoonMainView: View {
  
  //목록을 1부터 50까지
  let title = Array(1...24).map {"   제목\($0)"}
  let sectionTitle =  "신작 매일+ 월 화 수 목 금 토 일 완결"
  @State private var selection = 1
  
  var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
  
  var body: some View {
    TabView(selection: $selection) {
      ScrollView {
        ZStack(alignment: .top) {
          LazyVGrid(
            columns: columns,
            pinnedViews: [],
            content: {
              
              
              ForEach(title, id: \.self) { index in
                VStack {
                  RoundedRectangle(cornerRadius: 8)
                    .fill(Color.yellow)
                    .frame(width : 200, height: 260)
                  Text(index)
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  Text(index)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                  
                  
                }
              }
            }
            
            
          )}
      }.tabItem {
        VStack {
          Image(systemName: "1.square.fill")
          Text("웹툰")
        }
      }.tag(1)
      
      Text("Another Tab")
        .tabItem {
          Image(systemName: "2.square.fill")
          Text("추천완결")
        }
        .tag(2)
      Text("The Last Tab")
        .tabItem {
          Image(systemName: "3.square.fill")
          Text("배스트도전")
        }
        .tag(3)
      Text("The Last Tab")
        .tabItem {
          Image(systemName: "3.square.fill")
          Text("MY")
        }
        .tag(3)
      Text("The Last Tab")
        .tabItem {
          Image(systemName: "3.square.fill")
          Text("더보기")
        }
        .tag(3)
    }
    .accentColor(.black)
    .onAppear() {
      UITabBar.appearance().barTintColor = .white
    }
  }
   
}

 


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    WebtoonMainView().previewInterfaceOrientation(.landscapeLeft)
  }
}
