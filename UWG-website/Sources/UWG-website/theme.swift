////
////  File.swift
////
////
////  Created by Tommy Twardzik on 2/27/20.
////
//
//import Foundation
//import Publish
////import Plot
//
///// Themes are defined using the Theme type, which uses an HTMLFactory implementation to create all of a website’s HTML pages.
//extension Theme where Site == UWG {
//    static var primary: Self {
//        Theme(htmlFactory: PrimaryHTMLFactory())
//    }
//
//    /// Create the "Primary" theme.
//    private struct PrimaryHTMLFactory: HTMLFactory {
//
//        func makeItemHTML(for item: Article<UWG>,
//                          context: PublishingContext<UWG>) throws -> HTML {
//            HTML(
//                .head(for: item, on: context.site),
//                .body(
//                    .ul(
//                        .class("tags"),
//                        .forEach(item.metadata.tags) {
//                            .li(.text($0))
//                        }
//                    ),
////                    .p(
////                        "This will take around ",
////                        "\(Int(item.metadata.preparationTime / 60)) ",
////                        "minutes to prepare"
////                    ),
//                    .contentBody(item.body)
//                )
//            )
//        }
//    }
//}
