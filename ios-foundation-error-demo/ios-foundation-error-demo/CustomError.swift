//
//  CustomError.swift
//  ios-foundation-error-demo
//
//  Created by Kentaro on 2017/05/08.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import Foundation

/// Errorプロトコルに準拠した列挙型
enum CustomError: Error {
    case incorrectSourceUrl
    case incorrectDestinationPath
}

extension CustomError: CustomStringConvertible {

    var description: String {
        switch self {
        case .incorrectSourceUrl:
            return "URLが不正です。"

        case .incorrectDestinationPath:
            return "保存先のPATHが不正です。"
        }
    }
}
