//
//  TagCapsuleView.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct TagCapsuleView: View {
    let text: String
    let textColor = Color.black
    let bgColor = Color.gray.opacity(0.3)
    var onRemove: (()->Void)?
    @State private var hovering = false
    var body: some View {

        Text(text)
            .padding(.horizontal,12)
            .padding(.vertical, 6)
            .foregroundStyle(textColor)
            .background(bgColor)
            .clipShape(.capsule)
            .overlay(alignment: .trailing) {
                if hovering && onRemove != nil {
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(Color.red)
                        .padding(2)
                        .onTapGesture(perform: {
                            onRemove?()
                        })
                }
            }
            .onHover(perform: { hovering in
                self.hovering = hovering
            })
        
        
    }
    
}

#Preview {
    Group {
        TagCapsuleView(text: "hello")
        TagCapsuleView(text: "hello2",onRemove: {
            
        })
    }
        .frame(width: 200,height: 200)
}
