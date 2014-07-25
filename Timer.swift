
import Foundation

// Retains non-repeating timers
private var timers = [String:Timer]()

public class Timer {
  
  public let name: String?
  
  public let delay: Double
  
  public let callback: () -> ()
  
  public let repeats = false
  
  public convenience init (_ delay: Double, _ callback: () -> ()) {
    self.init(NSUUID().UUIDString, delay, callback)
  }
  
  public init (_ name: String, _ delay: Double, _ callback: () -> ()) {
    timers[name]?.kill()
    
    timers[name] = self
    self.name = name
    self.delay = delay
    self.callback = callback
    
    start()
  }
  
  public class func repeat (before delay: Double, _ callback: () -> ()) -> Timer {
    callback()
    return Timer(repeat: delay, callback)
  }
  
  public class func repeat (after delay: Double, _ callback: () -> ()) -> Timer {
    return Timer(repeat: delay, callback)
  }
  
  public class func named (name: String) -> Timer? {
    return timers[name]
  }
  
  public func start () {
    if nsTimer { return }
    nsTimer = NSTimer(timeInterval: delay, target: self, selector: "execute", userInfo: nil, repeats: repeats)
    NSRunLoop.currentRunLoop().addTimer(nsTimer!, forMode: NSRunLoopCommonModes)
  }
  
  public func pause () {
    if !nsTimer { return }
    nsTimer!.invalidate()
    nsTimer = nil
  }
  
  public func fire () {
    callback()
    kill()
  }
  
  public func kill () {
    pause()
    timers[name!] = nil
  }
  
  private var nsTimer: NSTimer?
  
  @objc private func execute () {
    callback()
    if !repeats { kill() }
  }
  
  private init (repeat delay: Double, _ callback: VoidClosure) {
    repeats = true
    
    self.delay = delay
    self.callback = callback
    
    start()
  }
}
