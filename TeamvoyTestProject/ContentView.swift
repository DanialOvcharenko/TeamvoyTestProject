//
//  ContentView.swift
//  TeamvoyTestProject
//
//  Created by Mac on 03.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedView = 1
    
    var body: some View {
        TabView (selection: $selectedView) {
            PostListView()
                .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Post list")
            } .tag(1)
            TestListPosts()
                .tabItem {
                Image(systemName: "ellipsis")
                    
                Text("Test List of Posts")
            } .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
