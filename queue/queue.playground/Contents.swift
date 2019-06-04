import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//let queue = DispatchQueue(label: "com.mobdim.queue.test.concurrent", attributes: .concurrent)
let queue = DispatchQueue(label: "com.mobdim.queue.test.serial")
let queue2 = DispatchQueue(label: "com.mobdim.queue2.test.serial")

func task1() {

    queue.async {
        for index in 0...10 {
            Thread.sleep(forTimeInterval: 0.5)
            print("\(index) ☠️")
        }
    }

    for index in 0...10 {
        Thread.sleep(forTimeInterval: 0.5)
        print("\(index) 😂")
    }
}

func task2() {
    for index in 0...10 {
        Thread.sleep(forTimeInterval: 0.3)
        print("\(index) 👍")
    }
}

func task22() {
    for index in 0...10 {
        Thread.sleep(forTimeInterval: 0.3)
        print("\(index) 👍👍")
    }
}

func task3() {
    for index in 0...10 {
        Thread.sleep(forTimeInterval: 0.2)
        print("\(index) 🔥")
    }

}

queue.async() {
    task1()
}

//queue.async(flags: .barrier) {
queue.async() {
    task2()
}

queue2.async {
    task22()
}

task3()
