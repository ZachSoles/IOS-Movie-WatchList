//
//  ContentView.swift
//  temp1
//
//  Created by Zach Soles on 8/2/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
            
            MovieWatchListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tray")
                        Text("Watch list")
                    }
            }
            .tag(1)
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
