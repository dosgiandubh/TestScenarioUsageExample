//
//  TestCase.swift
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

open class TestCase: TSCTestCase {
    public static func describe(_ testedObject: String, closure: @escaping (Context) -> Void) {
        let buildingContext = BuildingContext(path: .empty(for: testedObject)) { item in
            let legacyModel = TSCDescribedTestCase(name: item.systemName) {
                closure(ExecutingContext(assertion: item.assertion, precedingConditions: item.conditions))
            }
            generate(legacyModel)
        }
        closure(buildingContext)
    }
}
