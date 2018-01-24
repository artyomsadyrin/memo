//
//  UserDefaults.swift
//  memo
//
//  Created by Artsiom Sadyryn on 1/24/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

extension UserDefaults {
    func save<T : Encodable>(value: T, for key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            self.setValue(encoded, forKey: key)
        }
    }
    
    func load<T : Decodable>(for key: String) -> T? {
        if let result = self.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(T.self, from: result ) {
                return decoded
            }
        }
        return nil
    }
}
