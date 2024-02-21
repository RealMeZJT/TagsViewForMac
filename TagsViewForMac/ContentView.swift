//
//  ContentView.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var allTags = ["a","b","js","ab","cb","cb2"]
    @State var selections = ["js","ab"]
    
    @State private var showWarning = false
    
    var body: some View {
        VStack {
            TagsView(allTgas: allTags, selections: $selections) { newTag in
                if doSomeCheck(newTag) { // 可以根据业务，对新标签做一些合法性校验
                    allTags.append(newTag)
                    selections.append(newTag)
                } else {
                    showWarning = true
                }
            }
            
            if showWarning {
                Text("不合规的标签名")
                    .foregroundStyle(Color.orange)
                    .onTapGesture {
                        showWarning = false
                    }
            }
            
        }
        .padding()
    }
    
    
    func doSomeCheck(_ newTag: String) -> Bool {
        return  newTag != "fuck"
    }
    
}

#Preview {
    ContentView()
}
