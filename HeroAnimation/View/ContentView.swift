//
//  ContentView.swift
//  HeroAnimation
//
//  Created by ethancr0wn on 2021/04/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
