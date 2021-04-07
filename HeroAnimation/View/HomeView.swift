//
//  HomeView.swift
//  HeroAnimation
//
//  Created by ethancr0wn on 2021/04/07.
//

import SwiftUI

struct HomeView: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    var body: some View {
        VStack {
             ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                HStack {
                    Text("hello World")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 30, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding([.horizontal, .top])
                
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(hsCardData) {card in
                        VStack(alignment: .center, spacing: 10) {
                            Image(card.img)
                                .resizable()
                                .frame(width: 95, height: 160)
                            Text(card.title)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                }.padding(.horizontal)
                
            }
             .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
