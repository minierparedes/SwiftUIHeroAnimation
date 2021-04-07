//
//  HomeView.swift
//  HeroAnimation
//
//  Created by ethancr0wn on 2021/04/07.
//

import SwiftUI

struct HomeView: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var selected: HSCardModel = hsCardData[0]
    @State var show: Bool = false
    @State var loadView: Bool = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
             ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                HStack {
                    Text("HearthStone")
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
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selected = card
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            loadView.toggle()
                                        }
                                    }
                                }
                                .matchedGeometryEffect(id: card.id, in: namespace)
                            Text(card.title)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                    }
                }.padding([.horizontal, .bottom])
                
            }
             .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            if show {
                VStack {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(selected.img)
                            .resizable()
                            .frame(width: 190, height: 300)
                            .matchedGeometryEffect(id: selected.id, in: namespace)
                            .padding(.top, 50)
                            
                        if loadView {
                            HStack {
                                Spacer()
                                Button {
                                    loadView.toggle()
                                    withAnimation(.spring()) {
                                        show.toggle()
                                    }
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                            }
                            .padding(.top, 15)
                            .padding(.horizontal)
                        }
                    }
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                        VStack {
                            HStack {
                                Text(selected.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                                .multilineTextAlignment(.leading)
                                .padding(.top)
                                .padding(.horizontal)
                        }
                    }
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
            }
            
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .statusBar(hidden: show ? true : false)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
