//
//  File.swift
//  
//
//  Created by 최효원 on 2023/03/30.
//

import SwiftUI

struct QnA1View: View {
  @State private var isTag1Selected = false
  
  var body: some View {
    ZStack(alignment: .center) {
      Image("cut3")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .overlay(Color.black.opacity(0.6))
      
      VStack(alignment: .center) {
        
        Text("'A'는 지금 어떻게 \n 행동해야 할까요?")
          .font(.system(size: 101, weight: .heavy))
          .position(x: 670, y: 500)
          .frame(width: .infinity, height: 438)
          .foregroundColor(.white)
        
        HStack(alignment: .center, spacing: 60) {
          
          Text(" 1.\n\n다들 여기 처음 와서 \n어색하겠지..? \n먼저 말을 걸어본다.")
            .font(.system(size: 29, weight: .heavy))
            .background(
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 295, height: 218, alignment: .center)
                .foregroundColor(.white)
                
            )
            .padding(.trailing, 30)
            .tag(1)
            
          
          Text("  2.\n\n 뭐야..  왜 아무도 \n 말이 없지?  내가 말이 \n 되어야겠다! 히히힝 ~ ")
            .font(.system(size: 29, weight: .heavy))
            .background(
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 295, height: 218, alignment: .center)
                .foregroundColor(isTag1Selected ? Color.blue : Color.white)            )
            .padding(.trailing, 20)
            .tag(2)
            .onTapGesture {
              isTag1Selected = true
            }
            .foregroundColor(isTag1Selected ? Color.white : Color.black)
          
          Text(" 3.\n\n갑자기 몸이 근질근질\n하네... 뉴진스의 \n하입보이를 춘다.")
            .font(.system(size: 29, weight: .heavy))
            .background(
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 295, height: 218)
                .foregroundColor(.white)
            )
            .tag(3)
          
        }.position(x: 690, y: 420)
      }
    }

  }
}


struct QnA1View_Preview: PreviewProvider {
  static var previews: some View {
    QnA1View().previewInterfaceOrientation(.landscapeLeft)
  }
}
