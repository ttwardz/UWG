//
//  BlogHTMLFactory.swift
//  
//
//  Created by Povilas Staskus on 1/26/20.
//

import Publish
import Plot

extension Theme where Site == UWG {
    static var primary: Self {
        Theme(
            htmlFactory: UWGHTMLFactory(),
            resourcePaths: ["Resources/Style/theme.css"]
        )
    }
}

struct UWGHTMLFactory: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<UWG>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .posts(
                        for: context.allItems(
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site,
                        title: "Recent posts"
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeSectionHTML(for section: Section<UWG>, context: PublishingContext<UWG>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .pageContent(.h1(.text(section.title))),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeItemHTML(for item: Item<UWG>, context: PublishingContext<UWG>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .post(for: item, on: context.site),
                    .footer(for: context.site)
                )
                
            )
        )
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<UWG>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .page(for: page, on: context.site),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<UWG>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .pageContent(
                        .tagList(for: page, on: context.site)
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<UWG>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .posts(
                        for: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site,
                        title: "\(page.tag.string.capitalized) posts"
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }
}
