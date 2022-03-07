//
//  Context.swift
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

public protocol Context {
    func when(_ condition: String, closure: (Context) -> Void)
    func it(_ condition: String, closure: () -> Void)
}
