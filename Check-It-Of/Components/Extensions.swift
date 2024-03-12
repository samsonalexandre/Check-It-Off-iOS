//
//  Extensions.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 26.02.24.
//

import Foundation
import SwiftUI

// Erweiterung für die Rundung von Double auf 0 Dezimalstellen
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}


// Erweiterung zum Hinzufügen von abgerundeten Ecken zu bestimmten Ecken
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [ : ]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [ : ]
        } catch {
            return [ : ]
        }
    }
}
