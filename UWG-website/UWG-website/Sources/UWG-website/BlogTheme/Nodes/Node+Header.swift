//
//  Node+Header.swift
//  
//
//  Created by Povilas Staskus on 1/26/20.
//

import Plot

extension Node where Context == HTML.BodyContext {
    private static var sections: [UWG.SectionID] { [UWG.SectionID.about] }
    
    static func header(for site: UWG) -> Node {
        return .header(
            .h1(
                .text("\(site.name)")
            ),
            .nav(
                .ul(
                    .li(
                        .a(
                            .text("Home"),
                            .href("/")
                        )
                    ),
                    .li(
                        .a(
                            .text("Articles"),
                            .href("/articles")
                        )
                    ),
                    .li(
                        .a(
                            .text("About"),
                            .href("/about")
                        )
                    )
                )
            )//END nav
//        .div(
//            .div(
//                .class("pure-menu pure-menu-horizontal pure-u-1-1 top-header"),
//                .a(
//                    .class("pure-menu-heading"),
//                    .text(site.title),
//                    .href("/")
//                ),
//                .ul(
//                    .class("pure-menu-list"),
//                    .forEach(sections, { section in
//                        .li(
//                            .class("pure-menu-item"),
//                            .a(
//                                .class("pure-menu-link"),
//                                .text(section.rawValue.capitalized),
//                                .href(site.path(for: section))
//                            )
//                        )
//                    })
//                )
//            )
        )
    }
}
