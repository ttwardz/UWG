//
//  Node+Footer.swift
//  
//
//  Created by Povilas Staskus on 1/26/20.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func footer(for site: UWG) -> Node {
        return .footer(
            .div(
                .class("label"),
                .p(
                    .text("Copyright © 2020 Tom Twardzik")
                )
            ),
            .div(
                .ul(
                    .li(
                        .a(
                            .text("Website"),
                            .href("https://tomtwardzik.com")
                            )
                        ),
                    .li(
                        .a(
                            .text("Twitter"),
                            .href("https://twitter.com/ttwardz")
                        )
                    )
                )//END ul
            ),
            .div(
                .p(
                    .text("Generated using "),
                    .a(
                        .text("Publish"),
                        .href("https://github.com/johnsundell/publish")
                    ),
                    .text(". Written in Swift")
                )
            ),
            .div(
                .class("pure-u-1"),
                .a(
                    .text("RSS feed"),
                    .href("/feed.rss")
                )
            )
        )
    }
}
