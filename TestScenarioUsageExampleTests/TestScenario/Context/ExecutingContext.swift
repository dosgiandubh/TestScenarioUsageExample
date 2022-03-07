//
//  ExecutingContext.swift
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

struct ExecutingContext: Context {
    let assertion: String
    let precedingConditions: [String]

    func when(_ condition: String, closure: (Context) -> Void) {
        if condition == precedingConditions.first {
            closure(ExecutingContext(assertion: assertion, precedingConditions: Array(precedingConditions.dropFirst())))
        }
    }

    func it(_ assertion: String, closure: () -> Void) {
        if precedingConditions.isEmpty && assertion == self.assertion {
            closure()
        }
    }
}
