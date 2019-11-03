//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Laurent B on 02/11/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load file from bundle")
        }
        
        // create our JSON decoder
        let decoder = JSONDecoder()
        
        // create a date formatter
        let formatter = DateFormatter()
        // specify the format we want
        formatter.dateFormat = "y-MM-dd"
        
        // and add it to our decoder!
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode file from bundle")
        }
            
        return loaded
    }
     
    
}
