//
//  FormatStyle-LocalCurrency.swift
//  iExpenseV5
//
//  Created by Joe Yi on 12/10/22.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
