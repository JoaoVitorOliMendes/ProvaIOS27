//
//  notas.swift
//  ProvaIos27
//
//  Created by COTEMIG on 13/03/38 ERA1.
//

import Foundation

struct notas: Encodable, Decodable {
    var nome: String
    var id: String
    var nota: String
}
extension Encodable {
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}
