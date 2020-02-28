//
//  Node+Post.swift
//  
//
//  Created by Povilas Staskus on 1/26/20.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func post(for item: Item<UWG>, on site: UWG) -> Node {
        return .pageContent(
            .h2(
                .a(
                    .href(item.path),
                    .text(item.title)
                )
            ),
            .p(
                .text(DateFormatter.uwg.string(from: item.date))
            ),
            .tagList(for: item, on: site),
            .div(
                .div(
                    .contentBody(item.body)
                )
            )
        )
    }
}

