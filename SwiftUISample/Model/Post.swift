import UIKit

struct Post: Codable {
    var title: String
    var image: URL?

    enum CodingKeys: CodingKey {
        case title, image
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(image, forKey: .image)
    }
}
