
import UIKit

class AppDelegate : NSObject, UIApplicationDelegate {
  var window: UIWindow?
  func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]!) -> Bool {
    window = UIWindow()
    window!.makeKeyAndVisible()
    window!.rootViewController = UIViewController()
    return true
  }
}
