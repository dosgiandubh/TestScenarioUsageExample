//
//  BuildingContext.swift
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

struct BuildingContext: Context {
    let path: PartialPath
    let buildBlock: (CompletedPath) -> Void

    func when(_ condition: String, closure: (Context) -> Void) {
        closure(BuildingContext(path: path.appending(condition), buildBlock: buildBlock))
    }

    func it(_ assertion: String, closure: () -> Void) {
        buildBlock(path.completed(with: assertion))
    }
}
