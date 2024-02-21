//
//  ContentView.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var tags = ["a","b","js","ab","cb","cb2"]
    var body: some View {
        VStack {
            TagsView(tags: $tags)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
