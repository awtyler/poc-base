//
//  Date+Extension.swift
//  AQWritePOC
//
//  Created by Aaron on 11/6/19.
//  Copyright © 2019 Alchemy. All rights reserved.
//

import Foundation

extension Date {
    func stringWithFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
