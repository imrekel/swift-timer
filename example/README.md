## Timer Examples

&nbsp;&nbsp;&nbsp;&nbsp;
[Anonymous timer](#anonymous-timer)

&nbsp;&nbsp;&nbsp;&nbsp;
[Named timer](#named-timer)

&nbsp;&nbsp;&nbsp;&nbsp;
[Get a timer by its name](#get-a-timer-by-its-name)

&nbsp;&nbsp;&nbsp;&nbsp;
[Repeating timers](#repeating-timers)

&nbsp;&nbsp;&nbsp;&nbsp;
[Stop and restart a timer](#stop-and-restart-a-timer)

&nbsp;&nbsp;&nbsp;&nbsp;
[Prevent a timer from completing](#prevent-a-timer-from-completing)

&nbsp;&nbsp;&nbsp;&nbsp;
[Complete a timer early](#complete-a-timer-early)

---

### Anonymous timer

```Swift
Timer(0.5) {
	// code goes here
}

Timer(0.5, myFunc)
```

---

### Named timer

```Swift
Timer("hello world", 1) {
	// code goes here
}

Timer("hello world", 1, myFunc)
```

---

### Get a timer by its name

```Swift
let myTimer = Timer.named("hello world")

if myTimer != nil {
	// do stuff with the Timer
}
```

---

### Repeating timers

```Swift
let myTimer = Timer.repeat(after: 5) {
	// this code repeats after every 5 seconds
}

let myTimer = Timer.repeat(before: 10) {
	// this code repeats before every 10 seconds
}
```

---

### Stop and restart a timer

```Swift
myTimer.stop()

myTimer.start()
```

---

### Prevent a timer from completing

```Swift
myTimer.kill()
```

---

### Complete a timer early

```Swift
myTimer.fire()
```

