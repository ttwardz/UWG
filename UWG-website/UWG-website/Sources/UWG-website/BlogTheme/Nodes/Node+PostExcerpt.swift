//
//  Node+PostExcerpt.swift
//  
//
//  Created by Povilas Staskus on 1/26/20.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func postExcerpt(for item: Item<UWG>, on site: UWG) -> Node {
        return .section(
            .header(
                .h2(
                    .a(
                        .href(item.path),
                        .text(item.title)
                    )
                ),
                .p(
                    .text(DateFormatter.uwg.string(from: item.date)),
                    tagList(for: item, on: site)
                )
            ),
            .div(
                .p(.text(item.metadata.excerpt))
            )
        )
    }
}
