##Timer

Perform closures after a delay without all the hassle. **Timer** is a light wrapper around `NSTimer`, with the goal of being easy on the eyes and easy to use.

####Please note

- Each `Timer` handles its own memory management. You're not forced to use ivars! :smile:
- For your convenience, `Timer`s start themselves immediately after they're created!

####How to use

[Anonymous timers](#anonymous-timers)

[Naming a timer](#naming-a-timer)

[Getting a timer by its name](#getting-a-timer)

[Destroy a timer before it fires](#destroy-a-timer)

[Fire a timer prematurely](#fire-a-timer)

[Repeating timers](#repeating-timers)

####Properties

`var name: String`

The unique identifier

-

`let delay: Double`

Number of seconds the Timer waits until firing

-

`let callback: () -> ()`

The closure to be executed when the Timer fires

-

`let repeats: Bool`

Whether or not the timer continues past its first delay cycle

---

###Anonymous timers

```Swift
Timer(1) {
  println("A second has passed!")
}
```

###Naming a timer

```Swift
Timer("logo enter", 1.5, enterLogo)
```

###Getting a timer by its name

```Swift
if let timer = Timer.named("logo enter") {
  println("Timer \(timer.name) exists!")
}
```

###Destroy a timer before it fires

```Swift
timer.kill()
```

###Fire a timer prematurely

```Swift
timer.fire()
```

###Repeating timers

```Swift

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
