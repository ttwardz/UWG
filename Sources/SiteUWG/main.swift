//
//  main.swift
//
//
//  Created by Tommy Twardzik on 3/10/20.
//

import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct SiteUWG: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case articles
    }

    struct ItemMetadata: WebsiteItemMetadata {
        var author: String
//        var title: String
//        var description: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://unpublishedwritersguide.com/")!
    var name = "Unpublished Writer's Guide to Writing for No One"
    var description = "Resources and discussion written for unpublished writers by an unpublished writer."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try SiteUWG().publish(
    withTheme: .primary
//    ,
//    additionalSteps: [.deploy(using: .gitHub("ttwardz/UWG2.0"))]
)
