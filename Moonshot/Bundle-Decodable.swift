//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Laurent B on 02/11/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load file from bundle")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([Astronaut].self, from: data) else {
            fatalError("failed to decode file from bundle)
        }
            
        return loaded
    }
     
    
}
