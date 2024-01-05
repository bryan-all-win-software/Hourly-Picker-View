//
//  Hourly_PickerApp.swift
//  Hourly Picker
//
//  Created by User on 1/4/24.
//

import SwiftUI

@main
struct Hourly_PickerApp: App {
    var body: some Scene {
        WindowGroup {
            HourlyPickerView(format: .standard,
                        hourSelectionValue: .constant(""),
                        minuteSelectionValue: .constant(""),
                        meridiemSelectionValue: .constant(""))
        }
    }
}
