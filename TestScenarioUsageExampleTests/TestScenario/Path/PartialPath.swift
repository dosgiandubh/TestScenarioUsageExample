//
//  PartialPath.swift
//  TestScenario
//
//  Created by dosgiandubh on 18/07/2021.
//

struct PartialPath {
    let targetObject: String
    let conditionComponents: [String]

    static func empty(for targetObject: String) -> PartialPath {
        return PartialPath(targetObject: targetObject, conditionComponents: [])
    }

    func appending(_ newComponent: String) -> PartialPath {
        return PartialPath(targetObject: targetObject, conditionComponents: conditionComponents + [newComponent])
    }

    func completed(with assertion: String) -> CompletedPath {
        return CompletedPath(object: targetObject, assertion: assertion, conditions: conditionComponents)
    }
}
