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
        PostListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
