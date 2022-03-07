//
//  CounterTests.swift
//  TestisheUnitTests
//
//  Created by dosgiandubh on 06/08/2021.
//

import XCTest
@testable import TestScenarioUsageExample

final class CounterTests: TestCase {
    override class func start() {
        describe("counter") {
            $0.when("created with the default value") {
                let counter = Counter()

                $0.it("has the current value as 0") {
                    XCTAssertEqual(counter.currentValue, 0)
                }
                $0.when("has the increment block adding two") {
                    let customIncrement = 2
                    counter.incrementingClosure = { $0 + customIncrement }

                    $0.it("increments value by the set increment") {
                        counter.increment()

                        XCTAssertEqual(counter.currentValue, customIncrement)
                    }
                }
                $0.when("has the decrement block subtracting two") {
                    let customDecrement = 2
                    counter.decrementingClosure = { $0 - customDecrement }

                    $0.it("decrements value by the set decrement") {
                        counter.decrement()

                        XCTAssertEqual(counter.currentValue, -customDecrement)
                    }
                }
            }
            $0.when("created with five as the initial value") {
                let customInitialValue = 5
                let counter = Counter(initialValue: customInitialValue)

                $0.it("uses the given value") {
                    XCTAssertEqual(counter.currentValue, customInitialValue)
                }
            }
        }
    }
}
