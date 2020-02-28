//
//  Node+Grid.swift
//  
//
//  Created by Tom Twardzik on 02/27/20.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func grid(_ nodes: Node...) -> Node {
        .div(
//            .id("layout"),
            .class("container"),
            .group(nodes)
        )
    }
}
