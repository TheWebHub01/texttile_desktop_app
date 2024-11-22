import Cocoa
import FlutterMacOS
import FirebaseCore

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationDidFinishLaunching(_ aNotification: Notification) {
    FirebaseApp.configure()
    super.applicationDidFinishLaunching(aNotification)
  }
}
