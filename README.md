##Timer

Perform closures after a delay without all the hassle. `Timer` is a light wrapper around `NSTimer`, with the goal of being easy on the eyes and easy to use.

####Please note

- Each `Timer` handles its own memory management. You're not forced to use ivars! :smile:
- For your convenience, `Timer`s start themselves immediately after they're created!

####How to use

- [Anonymous timers](##anonymous-timers)
- [Naming a timer](##naming-a-timer)
- [Getting a timer by its name](##getting-a-timer)
- [Destroy a timer before it fires](##destroy-a-timer)
- [Fire a timer prematurely](##fire-a-timer)
- [Repeating timers](##repeating-timers)

####Properties

`var name: String` The unique identifier

`let delay: Double` Number of seconds the Timer waits until firing

`let callback: () -> ()` The closure to be executed when the Timer fires

`let repeats: Bool` Whether or not the timer continues past its first delay cycle

####Anonymous timers

```Swift
Timer(1) {
  println("A second has passed!")
}
```

####Naming a timer

```Swift
Timer("logo enter", 1.5, enterLogo)
```

####Getting a timer by its name

```Swift
if let timer = Timer.named("logo enter") {
  println("Timer \(timer.name) exists!")
}
```

####Destroy a timer before it fires

```Swift
timer.kill()
```

####Fire a timer prematurely

```Swift
timer.fire()
```

####Repeating timers

**Important**: Since repeating `Timer`s have longer lifetimes than single-use `Timer`s, you are required to retain the `Timer` on your own.

```Swift
// Execute a closure immediately and every 2 seconds afterwards
self.beepTimer = Timer.repeat(before: 2) {
  println("Beep")
}

// Execute a closure every 2 seconds, but not immediately
self.boopTimer = Timer.repeat(after: 2) {
  println("Boop")
}
```

####Crafted by [**@aleclarsoniv**](https://twitter.com/aleclarsoniv)
