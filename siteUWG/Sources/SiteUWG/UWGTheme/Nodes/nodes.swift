//
//  nodes.swift
//
//
//  Created by Tommy Twardzik on 3/12/20.
//

import Publish
import Plot

extension Node where Context: HTML.BodyContext {
//    private static var sections: [SiteUWG.SectionID] { [SiteUWG.SectionID.about] }
    
    static func header(
            for site: SiteUWG
    //        ,
    //        selectedSection: SiteUWG.SectionID?
        ) -> Node {
    //        let sectionIDs = SiteUWG.SectionID.allCases

            return .header(
                .div(
                    .a(.class("site-name"), .href("/"), .text(site.name))
    //                .if(sectionIDs.count > 1,
    //                    .nav(
    //                        .ul(.forEach(sectionIDs) { section in
    //                            .li(.a(
    //                                .class(section == selectedSection ? "selected" : ""),
    //                                .href(context.sections[section].path),
    //                                .text(context.sections[section].title)
    //                            ))
    //                        })
    //                    )
    //                )
                )
            )
        }
    
//    static func header(for site: SiteUWG) -> Node {
//        return .div(
////            .class("wrapper"),
//            .div(
//                .class("site-name"),
//                .a(
//                    .text(site.name),
//                    .href("/")
//                ),
//                .nav(
//                    .ul(
//                        .forEach(sections, { section in
//                            .li(
//                                .a(
//                                    .text(section.rawValue.capitalized),
//                                    .href(site.path(for: section))
//                                )
//                            )
//                        })
//                    )
//                )
//            )
//        )
//    }
}
