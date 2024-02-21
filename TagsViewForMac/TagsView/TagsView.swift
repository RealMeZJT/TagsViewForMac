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
    
    var onNewTag: ((String)->Void)?
    
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
                }, onNewTag: onNewTag)
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
