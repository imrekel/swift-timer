
import Foundation

// Retains non-repeating timers
private var timers = [String:Timer]()

public class Timer {
  
  // Unique identifier for the Timer
  public var name: String? {
    didSet {
      if oldValue == name { return }
      if oldValue { timers[oldValue!] = nil }
      if name { timers[name!] = self }
    }
  }
  
  // How long to wait per delay cycle
  public let delay: Double
  
  // What code to execute after every delay cycle
  public let callback: () -> ()
  
  // If the Timer exceeds past one delay cycle
  public let repeats = false
  
  /// Anonymous timer that's given a random name to be retained with
  /// NB: Does NOT need to be manually retained
  public convenience init (_ delay: Double, _ callback: () -> ()) {
    var name: String!
    do {
      name = __randomString(7)
    } while timers.indexForKey(name)
    
    self.init(name, delay, callback)
  }
  
  /// Named timer that can be referenced via Timer.named("unique id")
  /// NB: Does NOT need to be manually retained
  public init (_ name: String, _ delay: Double, _ callback: () -> ()) {
  
    // Stop a timer that has the same name, if it exists
    timers[name]?.kill()
    
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
  
  // Returns an existing Timer or nil
  public class func named (name: String) -> Timer? {
    return timers[name]
  }
  
  // Starts the Timer's delay cycle. 
  // Automatically called in all Timer inits.
  public func start () {
    if nsTimer { return } // Prevent the Timer from starting more than once
    nsTimer = NSTimer(timeInterval: NSTimeInterval(delay), target: self, selector: "execute", userInfo: nil, repeats: repeats)
    NSRunLoop.currentRunLoop().addTimer(nsTimer!, forMode: NSRunLoopCommonModes)
  }
  
  // Pauses and resets the Timer's delay cycle
  public func pause () {
    if !nsTimer { return }
    nsTimer!.invalidate()
    nsTimer = nil
  }
  
  // Immediately stops the Timer, and calls `self.callback`
  public func fire () {
    callback()
    kill()
  }
  
  // Releases the Timer, causing it to be deallocated if you
  // did not make a strong reference to it!
  public func kill () {
    pause()
    name = nil
  }
  
  // The beef of the operation
  private var nsTimer: NSTimer?
  
  @objc private func execute () {
    callback()
    if !repeats { kill() }
  }
  
  private init (repeat delay: Double, _ callback: VoidClosure) {
    self.delay = delay
    self.callback = callback
    self.repeats = true
    
    start()
  }
}

private let __alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

private func __randomString (length: Int) -> String {
  var string = ""
  for _ in 0..<length {
    string += __alphabet[Int(arc4random()) % countElements(__alphabet)]
  }
  return string
}
