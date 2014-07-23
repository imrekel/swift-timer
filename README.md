#Timer

Straight-forward, delayed closure execution in Swift. 

`Timer` is a light wrapper around `NSTimer`, with the goal of being easy on the eyes and easy to use.

###Take note

- Each single-use `Timer` handles its own memory management. You're not forced to use ivars! :smile:
- For your convenience, `Timer`s start themselves immediately after they're created!

###How to use

- [Anonymous timers](#anonymous)
- [Naming a timer](#naming)
- [Getting a timer by its name](#getting)
- [Pause & restart a timer](#pause)
- [Destroy a timer before it fires](#destroy)
- [Fire a timer prematurely](#fire)
- [Repeating timers](#repeating)

###Properties

`var name: String` The unique identifier

`let delay: Double` Number of seconds the Timer waits until firing

`let callback: () -> ()` The closure to be executed when the Timer fires

`let repeats: Bool` Whether or not the timer continues past its first delay cycle

###Anonymous timers<a name="anonymous"></a>

```Swift
Timer(1) {
  println("A second has passed!")
}
```

###Naming a timer<a name="naming"></a>

```Swift
Timer("logo enter", 1.5, enterLogo)
```

###Getting a timer by its name<a name="getting"></a>

```Swift
if let timer = Timer.named("logo enter") {
  println("Timer \(timer.name) exists!")
}
```

###Pause/start a timer<a name="pause"></a>

```Swift
// Pauses and resets the timer
timer.pause()

// Only useful if you `reset()` the timer first
timer.start()
```

###Destroy a timer before it fires<a name="destroy"></a>

```Swift
timer.kill()
```

###Fire a timer prematurely<a name="fire"></a>

```Swift
timer.fire()
```

###Repeating timers<a name="repeating"></a>

**Note**: Since repeating `Timer`s have longer lifetimes than single-use `Timer`s, you are required to retain the `Timer` on your own.

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
