//
//  nodes.swift
//
//
//  Created by Tommy Twardzik on 3/12/20.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    
    static func articleBreadcrumb<SiteUWG: Website>(for item: Item<SiteUWG>, on site: SiteUWG) -> Node {
        return .div(
            .class("breadcrumb"),
            .a(
                .text("Articles"),
                .href("/articles/")
            ),
            .text("  →  "),
            .a(
                .text("\(item.tags[0].string.capitalized)"),
                .href("/tags/\(item.tags[0])/")
            ),
            .text("  →  "),
            .text(item.title)
        )
    }
    
    static func articleDateAndTime<SiteUWG: Website>(for item: Item<SiteUWG>, on site: SiteUWG) -> Node {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy 'at' HH:mm a"
        return .div(
            .class("article-date"),
            .text(formatter.string(from: item.date))
        )
    }
    
    static func articleH1AndAuthor<SiteUWG: Website>(for item: Item<SiteUWG>, on site: SiteUWG) -> Node {
        return .div(
            .h1("\(item.title)")
//            .p("by \(item.author)")
        )
    }
}
