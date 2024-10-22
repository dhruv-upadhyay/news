//
//  BookmarkManager.swift
//  News
//
//  Created by Dhruv Upadhyay on 15/10/24.
//

import Foundation
import CoreData

extension Notification.Name {
    static let bookmarkUpdate = Notification.Name("BookmarkUpdate")
}

class BookmarkManager {
    static let shared = BookmarkManager()
    var bookmarks: [TblNews] = []
    private let viewContext = DBManager.shared.persistentContainer.viewContext
    
    private init() {
        fetchBookmarks()
    }
    
    func getBookMarksArticles() -> [MappedArticle] {
        fetchBookmarks()

        let mappedArticlesArray = bookmarks.compactMap { article -> MappedArticle? in
            // Safely unwrap and convert the URL strings to URL type
            guard article.title != "[Removed]" else { return nil }
            
            guard let link = URL(string: article.url ?? "") else { return nil }
            let imageUrl = URL(string: article.urlToImage ?? "")
            
            // Create a MappedArticle object
            return MappedArticle(
                title: article.title ?? "",
                description: article.desc,
                link: link,
                imageUrl: imageUrl,
                publishedAt: article.publishedAt ?? ""
            )
        }
        
        return mappedArticlesArray
    }
    
    func fetchBookmarks() {
        let request: NSFetchRequest<TblNews> = TblNews.fetchRequest()
        do {
            bookmarks = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch bookmarks: \(error)")
        }
    }
    
    func addBookmark(article: MappedArticle) {
        let news = TblNews(context: viewContext)
        news.id = article.id
        news.url = article.link.absoluteString
        news.title = article.title
        news.urlToImage = article.imageUrl?.absoluteString
        news.publishedAt = article.publishedAt
        news.desc = article.description
        news.timestamp = getTimestamp(dateString: article.publishedAt)
        
        saveContext()
        fetchBookmarks()
    }
    
    func removeBookmark(bookmark: MappedArticle) {
        NotificationCenter.default.post(name: .bookmarkUpdate, object: nil)
        let request: NSFetchRequest<TblNews> = TblNews.fetchRequest()
        request.predicate = NSPredicate(format: "timestamp == %@", getTimestamp(dateString: bookmark.publishedAt))

        do {
            let matchingNews = try viewContext.fetch(request)
            if let obj = matchingNews.first {
                viewContext.delete(obj)
                saveContext()
                fetchBookmarks()
            }
        } catch {
            print("Failed to check bookmark status: \(error)")
        }
    }
    
    func isBookmarked(article: MappedArticle) -> Bool {
        let request: NSFetchRequest<TblNews> = TblNews.fetchRequest()
        request.predicate = NSPredicate(format: "publishedAt == %@", article.publishedAt)
        
        do {
            let matchingNews = try viewContext.fetch(request)
            return !matchingNews.isEmpty
        } catch {
            print("Failed to check bookmark status: \(error)")
            return false
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

