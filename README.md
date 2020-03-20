# Cory🦊 X Lena🙆🏻‍♀️의 🌟**환상**🌟의 페어 프로그래밍
#### Ground Rule

> 스크럼

매일 🍦**10시**🍦까지 도착하여 스크럼을 진행한다.

- 각자 한 작업 공유
- 현재 상태 공유
- 당일 목표 설정 및 페어 프로그래밍 일정 조정
- Issue 정리
- 매주 금요일 🍦을 청산한다.

<br>

> GitHub

프로젝트, 마일스톤, 이슈기반으로 프로젝트 진행

<br>

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

