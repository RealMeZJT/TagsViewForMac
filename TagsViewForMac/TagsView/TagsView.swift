//
//  TagsView.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct TagsView: View {
    
    let allTgas: [String]
    @Binding var selections: [String]
    
    /**该block不为空时，用户搜索的标签不存在时，会在显示创建按钮。
        TagsView并不会创建标签，而是把用户意图通知给外部。
     */
    var newTagAction: ((String)->Void)?
    
    @State private var showAddingTag = false
    var body: some View {
        HStack(alignment: .center) {
            Button("", systemImage: "tag.fill") {
                showAddingTag.toggle()
            }
            .buttonStyle(LinkButtonStyle())
            .popover(isPresented: $showAddingTag, content: {
                TagsCreatablePopover(isPresented: $showAddingTag, items: allTgas,
                                     onSelectedTag: { tag in
                    if !selections.contains(tag) {
                        selections.append(tag)
                    }
                }, newTagAction: newTagAction)
            })
            
            TagsStack(tags: $selections)
        }
    }
}

#Preview {
    @State var allTags = ["a","b","js","ab","cb","cb2"]
    @State var selections = ["js","ab"]
    return TagsView(allTgas: allTags, selections: $selections)
        .frame(width: 200,height: 200)
}
