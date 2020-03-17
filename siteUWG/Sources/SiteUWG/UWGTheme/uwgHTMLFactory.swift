//
//  uwgHTMLFactory.swift
//  
//
//  Created by Tommy Twardzik on 3/11/20.
//

import Foundation
import Publish
import Plot

// Attach theme to HTMLFactory.
extension Theme where Site == SiteUWG {
    static var primary: Self {
        Theme(
            htmlFactory: UWGHTMLFactory(),
            resourcePaths:
                ["Resources/PrimaryTheme/styles.css"]
        )
    }
}

// Construct HTML components.
struct UWGHTMLFactory: HTMLFactory {

    func makeIndexHTML(for index: Index, context: PublishingContext<SiteUWG>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body(
                .wrapper(
                    .header(for: context, selectedSection: nil, page: nil),
                    .content(
                        .latestItem(
                            for: context.allItems(sortedBy: \.date, order: .descending),
                                on: context.site)
                    ),
                    .sidebar(
                        .div(
                            .class("label"),
                            .text("The Latest")
                        ),
                        .recentItemsList(
                            for: context.allItems(
                                sortedBy: \.date,
                                order: .descending),
                            on: context.site
                        )
                    ),
                    .footer(for: context.site)
                )//END grid
            )
        )
    }

    func makeSectionHTML(for section: Section<SiteUWG>,
                         context: PublishingContext<SiteUWG>) throws -> HTML {
        // Returning HTML of a Section Index Page that displays section items
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body(
                .wrapper(
                    .header(for: context, selectedSection: section.id, page: nil),
                    .content(
                        .h1(.text(section.title)),
                        .fullItemList(for: section.items, on: context.site)
                    ),
                    .sidebar(
                        .div(
                            .class("label"),
                            .text("The Latest")
                        ),("The Latest"),
                        .recentItemsList(for: section.items, on: context.site)
                    ),
                    .footer(for: context.site)
                ) //END grid
            )
        )
    }

    func makeItemHTML(for item: Item<SiteUWG>,
                      context: PublishingContext<SiteUWG>) throws -> HTML {
        // Returning HTML of a Post Page
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .class("item-page"),
                .wrapper(
                    .header(for: context, selectedSection: item.sectionID, page: nil),
                    .content(
                        .articleBreadcrumb(for: item, on: context.site),
                        .articleDateAndTime(for: item, on: context.site),
                        .article(
                            .articleH1AndAuthor(for: item, on: context.site),
                            .div(
                                .contentBody(item.body)
                            ),
                            .span("Tagged with: "),
                            .tagList(for: item, on: context.site)
                        )
                    ),
                    .sidebar(
                        .div(
                            .class("label"),
                            .text("The Latest")
                        ),
                        .recentItemsList(
                            for: context.allItems(
                                sortedBy: \.date,
                                order: .descending),
                            on: context.site
                        )
                    ),
                    .footer(for: context.site)
                )//END grid
            )
        )
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<SiteUWG>) throws -> HTML {
        // Returning HTML of a Section Page
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .wrapper(
                    .header(for: context, selectedSection: nil, page: page),
                    .content(
                        .contentBody(page.body)
                    ),
                    .sidebar(
                        .div(
                            .class("label"),
                            .text("The Latest")
                        ),("The Latest"),
                        .recentItemsList(
                            for: context.allItems(
                                sortedBy: \.date,
                                order: .descending
                            ),
                            on: context.site
                        )
                    ),
                    .footer(for: context.site)
                )//END grid
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<SiteUWG>) throws -> HTML? {
        // Returning HTML of a Page with list of available tags
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .wrapper(
                    .header(for: context, selectedSection: nil, page: nil),
                    .content(
                        .h1("Browse all tags"),
                        .ul(
                            .class("all-tags"),
                            .forEach(page.tags.sorted()) { tag in
                                .li(
                                    .class("tag"),
                                    .a(
                                        .href(context.site.path(for: tag)),
                                        .text(tag.string)
                                    )
                                )
                            }
                        )
                    ),
                    .sidebar(
                        .text("[sidebar]")
                    ),
                    .footer(for: context.site)
                )// END grid
            )
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<SiteUWG>) throws -> HTML? {
        // Returning HTML of a Page for a specific tag
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
                .wrapper(
                    .header(for: context, selectedSection: nil, page: nil),
                    .content(
                        .h1(
                            "Tagged with ",
                            .span(.class("tag"), .text(page.tag.string))
                        ),
                        .a(
                            .class("browse-all"),
                            .text("Browse all tags"),
                            .href(context.site.tagListPath)
                        ),
                        .fullItemList(
                            for: context.items(
                                taggedWith: page.tag,
                                sortedBy: \.date,
                                order: .descending
                            ),
                            on: context.site
                        )
                    ),
                    .sidebar(
                        .text("[sidebar]")
                    ),
                    .footer(for: context.site)
                )//END grid
            )
        )
    }
}


// Extensions

private extension Node where Context == HTML.BodyContext {
    
    // Add CSS classes as Swift funcs.
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
    static func content(_ nodes: Node...) -> Node {
        .div(.class("content"), .group(nodes))
    }
    
    static func sidebar(_ nodes: Node...) -> Node {
        .div(.class("sidebar"), .group(nodes))
    }
    
    static func header<SiteUWG: Website>(
        for context: PublishingContext<SiteUWG>,
        selectedSection: SiteUWG.SectionID?,
        page: Page?
    ) -> Node {
        let sectionIDs = SiteUWG.SectionID.allCases
        
        return .header(
            .div(
                .class("hdWrapper"),
                .a(
                    .class("site-name"),
                    .text("Unpublished Writer's Guide to Writing for No One"),
                    .href("/")
                ),
                .nav(
                    .ul(.forEach(sectionIDs) { section in
                        .li(.a(
                            .class(section == selectedSection ? "selected" : ""),
                            .href(context.sections[section].path),
                            .text(context.sections[section].title)
                            ))
                        },
                        .li(.a(
                            .class(page?.path.string.contains("about") ?? false == true ? "selected" : ""),
                            .href("/about"),
                            .text("About")
                            ))
                        )
                    )
                )
            )
        }
    
    static func recentItemsList<SiteUWG: Website>(for items: [Item<SiteUWG>], on site: SiteUWG) -> Node {
        
        let recentItems = items.prefix(3)
        
        return .ul(
            .class("recent-item-list"),
            .forEach(recentItems) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                    .tagList(for: item, on: site)
                ))
            }
        )
    }
    
    static func fullItemList<SiteUWG: Website>(for items: [Item<SiteUWG>], on site: SiteUWG) -> Node {
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MMM dd, yyyy"
        
        return .ul(
            .class("full-item-list"),
            .forEach(items) { item in
                .li(
                    .article(
                        .h1(.a(
                            .href(item.path),
                            .text(item.title)
                            )
                        ),
                        .p(.text(formatter1.string(from: item.date))),
                        .p(.text(item.description)),
                        .tagList(for: item, on: site)
                    )
                )
            }
        )
    }
    
    static func latestItem<SiteUWG: Website>(for items: [Item<SiteUWG>], on site: SiteUWG) -> Node {
        let latestItem = items[1]
        
        return .div(
            .class("item-page"),
            .div(
                .article(
                    .articleDateAndTime(for: latestItem, on: site),
                    .h1(.a(
                        .text(latestItem.title),
                        .href(latestItem.path)
                        )),
//                    .p("by \(latestItem.author)"),
                    .div(
                        .contentBody(latestItem.body)
                    )
                )
            )
        )
    }

    static func tagList<SiteUWG: Website>(for item: Item<SiteUWG>, on site: SiteUWG) -> Node {
        return .ul(.class("tag-list"), .forEach(item.tags) { tag in
            .li(.a(
                .href(site.path(for: tag)),
                .text(tag.string)
            ))
        })
    }
    
    static func footer<SiteUWG: Website>(for site: SiteUWG) -> Node {
        return .footer(
            .p(
                .text("Copyright &#169; 2020 Tom Twardzik")
            ),
            .p(
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            ),
            .p(.a(
                .text("RSS feed"),
                .href("/feed.rss")
            ))
        )
    }
}
