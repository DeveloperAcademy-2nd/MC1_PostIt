//
//  File.swift
//  
//
//  Created by 최효원 on 2023/03/30.
//

import Foundation

import SwiftUI

struct QnA2View: View {
  @State private var isTagSelected = false
  
  var body: some View {
    ZStack(alignment: .center) {
      Image("cut3")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .overlay(Color.black.opacity(0.6))
      
      VStack(alignment: .center) {
        
        Text(" 지금은 회의 중, \n 나는 어떻게 행동해야 할까요?")
          .font(.system(size: 101, weight: .heavy))
          .position(x: 670, y: 500)
          .frame(width: .infinity, height: 438)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
        
        HStack(alignment: .center, spacing: 60) {
          
          Text(" 1.\n\n오 좋아요~ \n다른 사람의 의견에 \n적극적으로 반응한다.")
            .font(.system(size: 29, weight: .heavy))
            .background(
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 295, height: 218, alignment: .center)
                .foregroundColor(.white)
                
            )
            .padding(.trailing, 30)
            
          
          Text("  2.\n\n 다들 배고파서 \n 아이디어를 못내나봐.. \n 우리 밥 먹고 할까요? ")
            .font(.system(size: 29, weight: .heavy))
            .background(
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 295, height: 218, alignment: .center)
                .foregroundColor(isTagSelected ? Color.blue : Color.white)
            )
            .padding(.trailing, 15)
            .onTapGesture {
              isTagSelected = true
            }
            .foregroundColor(isTagSelected ? Color.white : Color.black)
          
          Text("    3.\n\n   의견을 내지 못하면\n   장기자랑 하자고 한다. \n   흐흐 재밌겠군..")
            .font(.system(size: 29, weight: .heavy))
            .background(
              RoundedRectangle(cornerRadius: 30)
                .frame(width: 295, height: 218)
                .foregroundColor(.white)
            )
            
          
        }.position(x: 690, y: 420)
      }
    }

  }
}


struct QnA2View_Preview: PreviewProvider {
  static var previews: some View {
    QnA2View().previewInterfaceOrientation(.landscapeLeft)
  }
}
