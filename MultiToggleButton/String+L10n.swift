// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

enum L10n {
  /// Toggle
  case Toggle
  /// State
  case State
  /// Alter
  case Alter
  /// Color
  case Color
}

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .Toggle:
        return L10n.tr("Toggle")
      case .State:
        return L10n.tr("State")
      case .Alter:
        return L10n.tr("Alter")
      case .Color:
        return L10n.tr("Color")
    }
  }

  private static func tr(key: String, _ args: CVarArgType...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: NSLocale.currentLocale(), arguments: args)
  }
}

func tr(key: L10n) -> String {
  return key.string
}
