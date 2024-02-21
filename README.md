![main](https://github.com/RealMeZJT/ReadmePics/blob/main/iShot_2024-02-21_17.33.34.png)

![gif](https://github.com/RealMeZJT/ReadmePics/blob/main/iShot_2024-02-21_17.34.41.gif)

macos端的UI控件，操作、显示标签，应用场景如文章、笔记的标签栏。

## 安装
将 TagsView 文件夹拖入项目即可。

## 示例
参照ContentView


```swift
@State var allTags = ["a","b","js","ab","cb","cb2"]
@State var selections = ["js","ab"]

...

TagsView(allTgas: allTags, selections: $selections) { newTag in
        allTags.append(newTag)
        selections.append(newTag)
    }
```

