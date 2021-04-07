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
                                .frame(width: 115, height: 160)
                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 6, x: 3, y: 5)
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
                            Text(card.name)
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
                            .frame(width: 210, height: 300)
                            .matchedGeometryEffect(id: selected.id, in: namespace)
                            .padding(.top, 50)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 8, x: 3, y: 5)
                            
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
                        VStack(alignment: .center) {
                            HStack {
                                Text(selected.name)
                                    
                                    .font(hsFonts(Config.H2))
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                                    
                            }
                            .padding(.top)
                            .padding(.horizontal)
                            
                            
                            Text("\"\(selected.flavor)\"")
                                .font(.subheadline).italic()
                                .foregroundColor(.gray)
                                .padding(.bottom, 1)
                            Text(selected.text)
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.bottom, 5)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Type:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.type)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Text("Rarity:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.rarity)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Text("Set:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.set)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Text("Class:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.classType)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Text("Cost to Craft:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.classType)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Text("Artist:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.classType)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                HStack {
                                    Text("Collectible:")
                                        .font(.headline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.yellow)
                                    Text(selected.classType)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            }
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
