//
//  Counter.swift
//  TestScenarioUsageExample
//
//  Created by dosgiandubh on 06/08/2021.
//

final class Counter {
    var incrementingClosure: (Int) -> Int = { $0 + 1 }
    var decrementingClosure: (Int) -> Int = { $0 - 1 }

    private(set) var currentValue: Int

    init(initialValue currentValue: Int = 0) {
        self.currentValue = currentValue
    }

    func increment() {
        currentValue = incrementingClosure(currentValue)
    }

    func decrement() {
        currentValue = decrementingClosure(currentValue)
    }
}
