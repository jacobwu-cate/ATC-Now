//
//  Mock.swift
//  ATC Now!
//
//  Created by Academia on 4/22/20.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

struct Mock<T: Decodable>: Decodable {
    let data: T
}

/// 目前测试数据全部来自本地的 json 文件，位置在 Resource/Mock/*.json
/// - Parameter name: json 文件名
func mock<T: Decodable>(name: String) -> T {
    let url = Bundle.main.url(forResource: name, withExtension: "json")!
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Mock<T>.self, from: data)
        return result.data
    } catch {
        fatalError(error.localizedDescription)
    }
}
