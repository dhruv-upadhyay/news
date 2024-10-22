//
//  Constants.swift
//  News
//
//  Created by Dhruv Upadhyay on 14/10/24.
//

import Foundation

let apiKey = "266bb0333b234643b5328116d8ae98de"

// Images: contains asset names used in the app.
struct Images {
    static let newsDefaultPlaceholder: String = "newsDefaultPalceholder"
    static let logo: String = "logo"
    static let bookmarkFill: String = "bookmark.fill"
    static let bookmark: String = "bookmark"
    static let back = "chevron.left"
    static let noDataFound = "noDataImage"
}

// Sizes: contains static CGFloat constants for various sizes used throughout the app.
struct Sizes {
    static let s0p2: CGFloat = 0.2
    static let s0p3: CGFloat = 0.3
    static let zero: CGFloat = 0
    static let s1: CGFloat = 1
    static let s2: CGFloat = 2
    static let s3: CGFloat = 3
    static let s5: CGFloat = 5
    static let s8: CGFloat = 8
    static let s10: CGFloat = 10
    static let s16: CGFloat = 16
    static let s20: CGFloat = 20
    static let s36: CGFloat = 36
    static let s40: CGFloat = 40
    static let s80: CGFloat = 80
    static let s150: CGFloat = 150
    static let s200: CGFloat = 200
    static let s250: CGFloat = 250
}

// Params: static string constants representing parameter keys used in the app.
struct Params {
    static let url = "url"
}

// Titles: contains static strings for various titles used in the app.
struct Titles {
    static let readMore = "Read More"
    static let posted = "Posted:"
    static let date = "Date:"
    static let ago = "ago"
    static let topHeadlines = "Top Headlines"
    static let bbc = "BBC"
    static let bitcoin = "Bitcoin"
    static let apple = "Apple"
    static let bookmark = "Bookmarks"
    static let newsDetails = "News Details"
    static let readFullArticle = "Read Full Article"
    static let noDataFound = "No news found at the moment."
    static let noBookMark = "You haven't bookmarked any news yet."
    static let techCrunch = "Tech Crunch"
}

// Messages: static string constants for various messages displayed in the app.
struct Messages {
    static let failedToFetch = "Failed to fetch data:"
}

// Common: contains static string constants for common values used throughout the app.
struct Common {
    static let newsLink = "https://newsapi.org/v2/top-headlines?country=us&apiKey="
}

// NewsURLs: All lised url for respective news contents
struct NewsURLs {
    static let topNews = "https://newsapi.org/v2/top-headlines?country=us&apiKey="
    static let bbcNews = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey="
    static let bitcoinNews = "https://newsapi.org/v2/everything?q=bitcoin&apiKey="
    static let appleNews = "https://newsapi.org/v2/everything?q=apple&apiKey="
    static let techCrunch = "https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey="
}
