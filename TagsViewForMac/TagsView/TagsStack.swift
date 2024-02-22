//
//  TagsStack.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct TagsStack: View {
    @Binding var tags: [String]
    
    var body: some View {
  
//            .background(Color.black)
            
            ViewThatFits(in: .horizontal) {
                HStack {
                    eachTags()
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        eachTags()
                    }
                }
            }
            
        
    }
    
    @ViewBuilder
    private func eachTags() -> some View {
        ForEach(tags, id: \.self) { item in
            TagCapsuleView(text: item,willRemove: {
                tags.removeAll(where: {$0 == item})
            })
        }
    }
}

#Preview {
    @State var tags = ["a","b","js","ab","cb","cb2"]
    return TagsStack(tags: $tags)
        .frame(width: 200,height: 90)
}
