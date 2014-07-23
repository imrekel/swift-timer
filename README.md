##Timer

Perform closures after a delay without all the hassle. **Timer** is a light wrapper around `NSTimer`, with the goal of being easy on the eyes and easy to use.

####How to use

- Each `Timer` handles its own memory management. You're not forced to use ivars! :smile:
- For your convenience, `Timer`s start themselves immediately after they're created!

[Anonymous timers](#anonymous-timers)

[Naming a timer](#naming-a-timer)

[Getting a timer by its name]()

[Destroy a timer before it fires]()

[**Fire a timer prematurely]()

---

###Anonymous timers

```Swift
Timer(1) {
  println("A second has passed!")
}
```

###Naming a timer

```Swift
func enterLogo () {
  // Eye candy goes here
}

Timer("logo enter", 1.5, enterLogo) 
```

Retrieve a `Timer?` by its `name` with the `named(String)` method.

```Swift
if let timer = Timer.named("logo enter") {
  println("Timer \(timer.name) exists!")
}
```

A `Timer` instance gives you full access to its behavior. Here's a list of available properties and methods:

```Swift
// Destroy a Timer immediately
Timer.named("logo enter")?.kill()

// Pause a Timer so you can restart it later
timer.pause()

// Restart a Timer after you paused it
timer.start()

// Execute a Timer's callback immediately and kill it too
timer.fire()

// Get a Timer's unique identifier
let tid = timer.name

// 

// Get a Timer's callback
```
