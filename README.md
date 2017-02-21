# Error
## 概要
Errorは、エラーハンドリングをするために使用するプロトコルです。<br>Errorプロトコルに準拠したenumを作成して利用します。


```swift:sample.swift
// Errorプロトコルに準拠したCustomError
enum CustomError: Error {
    case aError
    case bError
    case cError
}
```
## 関連クラス
CFError、NSError
## 主要プロパティ

| プロパティ名 | 説明 | サンプル |
|:-----------:|:------------:|:------------:|
| localizedDescription | ローカライズされたエラーの説明を取得する | error.localizedDescription |

## 開発環境
| Category | Version |
|:-----------:|:------------:|
| Swift | 3.0.2 |
| Xcode | 8.2.1 |
| iOS | 10.0~ |

## 参考
https://developer.apple.com/reference/swift/error
