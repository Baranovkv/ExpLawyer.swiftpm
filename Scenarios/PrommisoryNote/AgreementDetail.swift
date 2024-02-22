//
//  File.swift
//  
//
//  Created by Kirill Baranov on 11/02/24.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct AgreementDetail: Codable, Identifiable, DraggableItem, Transferable {
    
    var id = UUID()
    let title: String
    var startBox: String
    var correctBox: String
    var currentBox: String
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: AgreementDetail.self, contentType: .agreementDetail)
    }
}

extension UTType {
    static let agreementDetail = UTType(exportedAs: "AgreementDetail")
}
