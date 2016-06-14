// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIImage {
  enum Asset: String {
    case Camera_Flash = "camera-flash"
    case Clock = "clock"
    case Default = "Default"
    case Facebook = "facebook"
    case Test_tube = "test_tube"

    var image: UIImage {
      return UIImage(asset: self)
    }
  }

  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
