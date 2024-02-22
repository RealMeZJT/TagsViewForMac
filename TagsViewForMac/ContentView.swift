//
//  ContentView.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct ContentView: View {
    @State var allTags = ["swift","ios","apple","macos","js","game"]
    @State var selections = ["apple","macos"]
    
    @State private var showWarning = false
    
    var body: some View {
        
        VStack {
            //不可创建新标签
            TagsView(allTgas: allTags, selections: $selections)
            
            Divider()
            
            //可创建新标签
            TagsView(allTgas: allTags, selections: $selections, newTagAction:  { newTag in
                if doSomeCheck(newTag) { // 可以根据业务，对新标签做一些合法性校验
                    allTags.append(newTag)
                    selections.append(newTag)
                } else {
                    showWarning = true
                }
            })
            
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
