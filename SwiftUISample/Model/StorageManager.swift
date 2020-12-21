import Foundation
import UIKit

enum StorageError: Error {
    case noKnownPath
    case unknownError
}

/// Storage helper class for storing data locally in the `File System` through `FileManager`.
class StorageManager {
    private var fileManager = FileManager.default
    private var imgDirPath: URL?

    func retrievePosts() throws -> [UIImage] {
        guard let path = imageFilePath() else {
            throw StorageError.noKnownPath
        }

        let data = try Data(contentsOf: path)

        if let images = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [UIImage] {
            return images
        }

        throw StorageError.unknownError
    }

    func storePosts(_ images: [UIImage?]) throws {
        guard let path = imageFilePath() else {
            throw StorageError.noKnownPath
        }

        let postsData = try NSKeyedArchiver.archivedData(withRootObject: images, requiringSecureCoding: false)
        try postsData.write(to: path)
    }

    private func filePath(forKey key: String) -> URL? {
        guard let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }

        return documentURL.appendingPathComponent(key)
    }

    private func imageFilePath() -> URL? {
        var dirPath: URL?
        if let imgDirPath = self.imgDirPath {
            dirPath = imgDirPath
        } else {
            if let imgDirPath = filePath(forKey: "postResources") {
                self.imgDirPath = imgDirPath
                dirPath = imgDirPath
            }
        }
        return dirPath
    }
}
