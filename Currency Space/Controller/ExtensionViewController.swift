//
//  ExtensionViewController.swift
//  Currency Space
//


import Foundation

extension ViewController{
    
    // Computed property for current date
    var currentDateValueLabel: String {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "dd MM yyyy"
        return dateValue.string(from: NSDate.now)
    }
    // Set start date value for API NBU URL 
    var currentDateValueUrl: String {
        let dateValue = DateFormatter()
        dateValue.dateFormat = "yyyyMMdd"
        return dateValue.string(from: NSDate.now)
    }

    
}
