//
//  Node+Sidebar.swift
//  
//
//  Created by Povilas Staskus on 1/26/20.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func sidebar(for site: UWG) -> Node {
        return .div(
            .div(
                .p(.text("Recents"))
            ),
            .div(
                .p(.text("Categories"))
            )
        )
    }
}
