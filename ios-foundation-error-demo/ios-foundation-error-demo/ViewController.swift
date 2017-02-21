//
//  ViewController.swift
//  ios-foundation-error-demo
//
//  Created by OkuderaYuki on 2017/02/22.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit

/// Errorプロトコルに準拠した列挙型
enum CustomError: Error {
    case incorrectSourceUrl
    case incorrectDestinationPath
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        writeToFileError()
    }
    
    /// ファイル書き込み時のエラー
    private func writeToFileError() {
        
        do {
            let imageUrlString = "https://images-na.ssl-images-amazon.com/images/I/619XgyIYnBL._AC_UL115_.jpg"
            guard let url = URL(string: imageUrlString) else { return }
            guard let imageData = try? Data(contentsOf: url) else {
                // urlからデータを生成できない場合
                throw CustomError.incorrectSourceUrl
            }
            
            let destinationPath = "test.jpg"
            let destinationURL = URL(fileURLWithPath: destinationPath)
            if destinationURL.isFileURL == false {
                // 保存先がファイルPATHでない場合
                throw CustomError.incorrectDestinationPath
            }
            do {
                try imageData.write(to: destinationURL, options: [.atomic])
            } catch let error {
                // ファイル書き込みに失敗した場合
                print("\(error.localizedDescription)")
                showErrorAlert(error: error)
            }
            
        } catch CustomError.incorrectSourceUrl {
            print("URLが不正です。")
        } catch CustomError.incorrectDestinationPath {
            print("保存先のPATHが不正です。")
        } catch {
            print("不明なエラーです。")
        }
    }
    
    //MARK:- Alert
    
    /// エラーの説明をアラートで表示する
    ///
    /// - Parameter error: (Error)
    func showErrorAlert(error: Error) {
        let title = "error"
        let message = error.localizedDescription
        let btnTitle = "OK"
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: btnTitle,
                                        style: .default,
                                        handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
