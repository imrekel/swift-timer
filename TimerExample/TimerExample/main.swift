
// Anonymous timer
Timer(0.5) {
  println("Anonymous timer completed after 0.5 seconds")
}



// Named timer
Timer("hello world", 1) {
  println("Named timer completed after 1 second")
}



// Repeating timer after every interval
let timerAfter = Timer.repeat(after: 2) {
  println("Timer completed a cycle after 2 seconds")
}

// Pause a timer and start it again
timerAfter.pause()
println("Paused repeating timer")
Timer(4) {
  timerAfter.start()
  println("Started repeating timer")
}



// Repeating timer before every interval
let timerBefore = Timer.repeat(before: 4) {
  println("Timer completed a cycle before 4 seconds")
}

// Kill a repeating timer
Timer(8, {
  timerBefore.kill()
  println("Killed repeating timer")
})



// Find a timer by name and fire it early
Timer("fire early", 1000) {
  println("Timer fired early!")
}

if let timer = Timer.named("fire early") {
  timer.fire()
} else {
  fatalError("Timer.named() did not work")
}



// Keeps the process running
import UIKit
UIApplicationMain(C_ARGC, C_ARGV, nil, NSStringFromClass(AppDelegate))
