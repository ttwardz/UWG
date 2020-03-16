////
////  nodes.swift
////
////
////  Created by Tommy Twardzik on 3/12/20.
////
//
//import Publish
//import Plot
//
//extension Node where Context == HTML.BodyContext {
//    private static var sections: [SiteUWG.SectionID] {
//        [SiteUWG.SectionID.about]
//    }
//    
//    static func header(for site: SiteUWG) -> Node {
//        return .header(
//            .wrapper(
//                .a(.class("site-name"), .href("/"), .text(context.site.name)),
//                .if(sections.count > 1,
//                    .nav(
//                        .ul(.forEach(sections) { section in
//                            .li(.a(
//                                .class(section == selectedSection ? "selected" : ""),
//                                .href(context.sections[section].path),
//                                .text(context.sections[section].title)
//                                ))
//                            })
//                    )
//                )
//            )
//        )
//    }
//}
