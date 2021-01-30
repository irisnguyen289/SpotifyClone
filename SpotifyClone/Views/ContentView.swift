//
//  ContentView.swift
//  SpotifyClone
//
//  Created by mac on 1/30/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection){
            HomePage()
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            SearchPage()
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            ContentItemViewer()
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Current")
                    }
                }
            SearchPage()
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
