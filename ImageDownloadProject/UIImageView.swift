import Foundation
import UIKit

extension UIImageView {
    final func load(url: NSURL, progressClosure: ((Double) -> Void)? = nil) {
        Task {
            let (asyncBytes, urlResponse) = try await URLSession.shared.bytes(from: url as URL)
            let length = urlResponse.expectedContentLength
            var data = Data()
            data.reserveCapacity(Int(length))
            
            for try await byte in asyncBytes {
                data.append(byte)
                let progress = Double(data.count) / Double(length)
                progressClosure?(progress)
                
            }
            
            guard let image = UIImage(data: data) else { return }
            self.image = image
            progressClosure?(1)
        }
    }
}
