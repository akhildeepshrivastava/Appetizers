//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/29/20.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: self)!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: self)!

    }
}
