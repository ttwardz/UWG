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
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
        var title: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://unpublishedwritersguide.com/")!
    var name = "Unpublished Writer's Guide to Writing for No One"
    var description = "Resources and discussion written for unpublished writers by an unpublished writer."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try SiteUWG().publish(withTheme: .primary)
