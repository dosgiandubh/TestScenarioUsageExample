//
//  CompletedPath.swift
//  TestScenario
//
//  Created by dosgiandubh on 18/07/2021.
//

struct CompletedPath {
    var object: String
    var assertion: String
    var conditions: [String]

    var systemName: String {
        let generalPart = "test_\(withoutIllegalCharacters(object))_\(withoutIllegalCharacters(assertion))"
        let name: String
        if conditions.isEmpty {
            name = generalPart
        } else {
            let filteredCondition = conditions
                .map { "when_\(withoutIllegalCharacters($0))" }
                .joined(separator: "_and_")
            name = "\(generalPart)_\(filteredCondition)"
        }
        return name
    }

    private func withoutIllegalCharacters(_ string: String) -> String {
        return string
            .replacingOccurrences(of: "[^A-Za-z0-9 ]", with: "", options: .regularExpression)
            .replacingOccurrences(of: " ", with: "_")
    }
}
