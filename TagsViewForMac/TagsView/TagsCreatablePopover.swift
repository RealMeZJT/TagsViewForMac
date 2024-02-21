//
//  TagsCreatablePopover.swift
//  TagsViewForMac
//
//  Created by jiatao zhou on 2024/2/21.
//

import SwiftUI

struct TagsCreatablePopover: View {
    @Binding var isPresented: Bool
    var items: [String]
    var onSelectedTag: ((String)->Void)
    var onNewTag: ((String)->Void)?

    @State private var selection: String = ""
    @State private var searchText = ""
    private var shouldNewTag: Bool {
        !searchText.isEmpty
            && selection != searchText
            && onNewTag != nil
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            TextField("", text: $searchText, prompt: nil)
                .onSubmit {
                    if !selection.isEmpty {
                        onSelectedTag(selection)
                        isPresented = false
                    }
                }
                .padding([.top,.leading,.trailing])
            
            if shouldNewTag {
                Button("创建新标签 “\(searchText)”") {
                    onNewTag?(searchText)
                    isPresented = false
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundStyle(Color.accentColor)
                .padding(.top)
                .padding(.horizontal)                
            }
            
            ScrollViewReader { proxy in
                mList
                    .onChange(of: searchText) { oldValue, newValue in
                        selection = matching(newValue)
                        proxy.scrollTo(selection)
                    }
                
            }
            .frame(minWidth: 180, minHeight: 300,alignment: .topLeading)
        }
    }
    
    private var mList: some View {
        
        List(selection: $selection) {
            ForEach(items,id: \.self) { item in
                HStack {
                    Text(item)
                    if (item == selection) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                    }
                }
                .onTapGesture {
                    onSelectedTag(item)
                    isPresented = false
                }
                .tag(item)
                .id(item)
            }
            
        }
        .scrollContentBackground(.hidden)
                        
    }
    
    private func matching(_ keyword: String) -> String {
        // 排序，优先匹配短的字符串。
        // 否则会遇到类似的情况：输入shell时， 匹配到了powershell，而不是 shell。
        // 显然不是我们通常想要的结果。
        items
            .sorted(by: { s1, s2 in
                s1.count < s2.count
            })
            .first(where: {$0.contains(keyword)}) ?? selection
    }
}

#Preview {
    TagsCreatablePopover(isPresented: .constant(true), items: ["a1","a2","b1"], onSelectedTag: {tag in }, onNewTag: { newTag in
        
    })
        .frame(width: 300)
}
