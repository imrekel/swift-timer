**Version:** 0.1.0

**Description:** Easily delay the execution of a closure or function. `Timer` is a Swift wrapper around [`NSTimer`](https://developer.apple.com/library/mac/documentation/cocoa/Reference/Foundation/Classes/NSTimer_Class/Reference/NSTimer.html).

[Benefits](#benefits)

[Examples](https://github.com/aleclarson/swift-timer/tree/master/example)

[Timer.swift](#timer-swift)

[Release Notes](#release-notes)

---

### Benefits

- Simpler syntax! :poop:
- Single-use timers are retained for you! :v:
- Easy access to timers from anywhere in your project!
- Easily make a repeating timer that executes immediately!

[**See examples here!**](https://github.com/aleclarson/swift-timer/tree/master/example)

---

### Timer

#### Constructors

`init (String, Double, Void -> Void)`

> Creates a named `Timer` with the given `name`, `delay`, and `handler`.

`convenience init (Double, Void -> Void)`

> Creates an anonymous `Timer` with the given `delay` and `handler`. A random `name` is generated.

#### Properties

`let name: String?` 

> The unique identifier

`let delay: Double` 

> Number of seconds the Timer waits until firing

`let handler: Void -> Void` 

> The closure to be executed when the Timer fires

`let repeats: Bool` 

> Whether or not the timer continues past its first delay cycle

#### Methods

`func start ()`

> Begins the countdown from `delay` to `0` seconds. Called automatically when a new `Timer` is constructed. Can be used after `stop()` is called. Adds the timer to `NSRunLoop.currentRunLoop()`.

`func stop ()`

> Stops the countdown that was started via `start()`. After calling this, you can call `start()` to restart the countdown.

`func fire ()`

> Completes the `Timer` early and releases it from memory.

`func kill ()`

> Prevents the `Timer` from completing and releases it from memory.

#### Class Methods

`class func repeat (before: Double, Void -> Void) -> Timer`

> Creates a repeating `Timer` that fires its `handler` **immediately** and after every `delay` seconds.

`class func repeat (after: Double, Void -> Void) -> Timer`

> Creates a repeating `Timer` that fires its `handler` after every `delay` seconds.

`class func named (String) -> Timer?`

> Returns an existing `Timer` with the given `name`, or nil.

---

####Crafted by [**@aleclarsoniv**](https://twitter.com/aleclarsoniv)
