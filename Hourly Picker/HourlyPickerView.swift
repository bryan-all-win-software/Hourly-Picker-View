//
//  ContentView.swift
//  Hourly Picker
//
//  Created by Bryan Luna on 1/4/24.
//

import SwiftUI

struct HourlyPickerView: View {
    
    enum Format {
        case standard
        case international
        
        var hours: [String] {
            return switch self {
                case .standard: (1...12).map { "\($0)"}
                case .international: (0...23).map { "\($0)" }
            }
        }
    }
    
    @Binding private var hourSelectionValue: String
    @Binding private var minuteSelectionValue: String
    @Binding private var meridiemSelectionValue: String
    
    private let format: Format
    private let hours: [String]
    private let minutes: [String]
    private let meridiem: [String]
    
    init(format: Format = .standard,
         hourSelectionValue: Binding<String>,
         minuteSelectionValue: Binding<String>,
         meridiemSelectionValue: Binding<String> = .constant("")) {
        
        self.format = format
        self.hours = format.hours
        self.minutes = (0...59).map { "\($0)" }
        self.meridiem = ["AM", "PM"]
        
        _hourSelectionValue = hourSelectionValue
        _minuteSelectionValue = minuteSelectionValue
        _meridiemSelectionValue = meridiemSelectionValue
    }
    
    var body: some View {
        
        HStack {
            
            pickerView(for: hours, selection: $hourSelectionValue)
            
            Text(":")
                .foregroundStyle(.yellow)
            
            pickerView(for: minutes, selection: $minuteSelectionValue)
            
            if format == .standard {
                pickerView(for: meridiem, selection: $meridiemSelectionValue)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
    
    private func pickerView(for collection: [String], selection: Binding<String>) -> some View {
        
        Picker("", selection: selection) {
            ForEach(collection, id: \.self) { item in
                Text(item)
                    .foregroundStyle(.yellow)
            }
        }
        .pickerStyle(.wheel)
        .frame(maxWidth: 50, maxHeight: 150)
    }
}

#Preview {
    HourlyPickerView(format: .international,
                hourSelectionValue: .constant(""),
                minuteSelectionValue: .constant(""),
                meridiemSelectionValue: .constant(""))
}
