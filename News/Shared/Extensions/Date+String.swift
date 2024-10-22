//
//  Date+String.swift
//  News
//
//  Created by Dhruv Upadhyay on 14/10/24.
//

import Foundation

func identifyDateFormat(of dateString: String) -> String? {
    // List of possible date formats
    let possibleFormats = [
        "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSZ",
        "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        "yyyy-MM-dd'T'HH:mm:ssZ",
        "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSS",
        "yyyy-MM-dd'T'HH:mm:ss.SSS",
        "yyyy-MM-dd'T'HH:mm:ss"
    ]
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")

    // Try each format to see which one can parse the date string
    for format in possibleFormats {
        dateFormatter.dateFormat = format
        if let _ = dateFormatter.date(from: dateString) {
            return format // Return the format if parsing is successful
        }
    }
    
    // Return nil if no format matches
    return nil
}

// Function to format the date in DD-MM-YYYY format
func formatDateToDDMMYYYY(dateString: String) -> String? {
    // Define the input date format
    let inputDateFormat = identifyDateFormat(of: dateString)
    let outputDateFormat = "dd-MM-yyyy"
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inputDateFormat
    
    // Convert the input string to Date
    guard let date = dateFormatter.date(from: dateString) else {
        return nil
    }
    
    // Format the Date to the desired output format
    dateFormatter.dateFormat = outputDateFormat
    return dateFormatter.string(from: date)
}

// Function to calculate "time ago" string
func timeAgo(from dateString: String) -> String? {
    // Define the input date format
    let inputDateFormat = identifyDateFormat(of: dateString)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inputDateFormat
    
    // Convert the input string to Date
    guard let date = dateFormatter.date(from: dateString) else {
        return nil
    }
    
    let calendar = Calendar.current
    let now = Date()
    
    // Calculate the time interval
    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: now)
    
    if let minute = components.minute, minute < 60 {
        return "\(minute) min ago"
    } else if let hour = components.hour, hour < 24 {
        return "\(hour) hour ago"
    } else if let day = components.day, day < 30 {
        return "\(day) day ago"
    } else if let month = components.month, month < 12 {
        return "\(month) month ago"
    } else if let year = components.year {
        return "\(year) year ago"
    }
    
    return nil
}

func getTimestamp(dateString: String) -> String {
    let dateFormatter = ISO8601DateFormatter()

    if let date = dateFormatter.date(from: dateString) {
        let timestamp = date.timeIntervalSince1970
        return "\(timestamp)"
    } else {
        return ""
    }
}
