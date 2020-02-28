import Foundation
import Publish
import Plot

struct UWG: Website {
    enum SectionID: String, WebsiteSectionID {
        case articles
        case about
    }

///Here, we’ve added support for our own, site-specific item metadata through the ItemMetadata type, which we’ll be able to use in a fully type-safe manner all throughout our publishing process.
    struct ItemMetadata: WebsiteItemMetadata {
        var excerpt: String
        var slug: String
    }

    var url = URL(string: "https://unpublishedwritersguide.com")!
    var name = "Unpublished Writer's Guide to Writing for No One"
    var description = "Written for unpublished writers by an unpublished writer."
    var language: Language { .english }
    var imagePath: Path? { "images/logo.png" }
    var title: String = "UWG"
}

try UWG().publish(
    withTheme: .uwg
//    additionalSteps: [.deploy(using: .gitHub("ttwardz/UWG2.0"))]
)
