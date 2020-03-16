# photos-6
iOS 3월 연습 - 6팀



## 1. collectionView

> A. UICollectionViewDataSource

**\#Delegate \#Object**

collectionView의 dataSource를 클래스의 인스턴스로 생성해서 collectionView의 역할을 위임했다.

> B. random

RGB에 들어가는 세부값을 random하게 설정했다.

```swift
init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
```

> C. cellSize

Estimate Size를 custom으로 설정해서 스토리보드에 적용되지 않았던 cell size를 반영되도록 했다.

[Photo CollectionViewCell Size #1](https://github.com/codesquad-memeber-2020/photos-6/issues/1)

> D. Screenshot

<img src="https://github.com/codesquad-memeber-2020/photos-6/tree/dev/screenshots/collectionView-1.png" width="400px">

