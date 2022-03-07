# TestScenario

## Motivation

This framework was inspired by Quick [link](https://github.com/Quick/Quick/). It provides a great DSL to organize test cases in unit-tests, but there was a problem with configuring environment. Every `beforeEach` and `afterEach` forces the developer to write a lot of boilerplate code, which, I thought, should be avoided. So TestScenario was designed to reduce the amount of uninformative code.

That how a written by Quick test-case looks:

```swift
import Quick

class SomeModuleViewModelTests: QuickSpec {
  override func spec() {
    describe("view model") {
      var viewModel: SomeModuleViewModel!
      var dependency1: Dependency1Mock!
      var dependency2: Dependency2Mock!
      var dependency3: Dependency3Mock!
      
      beforeEach {
        dependency1 = Dependency1Mock()
        dependency2 = Dependency2Mock()
        dependency3 = Dependency3Mock()
        viewModel = SomeModuleViewModel(dependency1, dependency2, dependency3)
      }

      it("does something") {
        // Testing
      }
    }
  }
}
```

and how it can be written by TestScenario:

```swift
import TestScenario

class SomeModuleViewModelTests: TestCase {
  override class func start() {
    describe("view model") {
      let dependency1 = Dependency1Mock()
      let dependency2 = Dependency2Mock()
      let dependency3 = Dependency3Mock()
      let viewModel = SomeModuleViewModel(dependency1, dependency2, dependency3)

      $0.it("does something") {
        // Testing
      }
    }
  }
}
```

Every scope of TestScenario can be used to configure the current environment, and it allows to seriously reduce the amount of configuration code. And your configuration will be re-run for every test-case to avoid any side effects.

## Elements of a test-case

Every test-case consists of one `describe` block (what is tested), zero or more `when` blocks (conditions where it is tested in), and one `it` block (what it should do).

```swift
override class func start() {
  describe("view model") {
    // Creating a new instance of the tested view model

    $0.when("user taps the info button") {
      // Scheduling the info button tap

      $0.when("service returns info without errors") {
        // Mocking the service to return info

        $0.it("shows the received info") {
          // Checking the view model passes the info to its view
        }
      }
    }
  }
}
```

Unnamed argument `$0` is used because every scope (except `it`) gets an own `Context`, and that is a necessary part of this DSL.

## Order of execution

For every `it` block, the framework invokes every enclosed scope to reset all configuration. This example contains a few test-cases:

```swift
override class func start() {
  describe("describe") {
    print("describe")
    
    $0.when("condition1") {
      print("condition1")
      
      $0.it("check1") {
        print("check1")
      }
      $0.when("condition2") {
        print("condition2")
      
        $0.it("check2") {
          print("check2")
        }
        $0.it("check3") {
          print("check3")
        }
      }
    }
    $0.when("condition3") {
      print("condition3")
    
      $0.it("check4") {
        print("check4")
      }
      $0.it("check5") {
        print("check5")
      }
    }
  }
}
```

This will print the following log:

```
describe
condition1
check1

describe
condition1
condition2
check2

describe
condition1
condition2
check3

describe
condition3
check4

describe
condition3
check5
```

## Main components

The core objects are `Context`'s. The first step, registering test-cases and generating methods for them, is done by `BuildingContext`. It executes all closures/scopes and search for `it` blocks. The second step, running the found test-cases, is a responsibility of `ExecutingContext`. It executes only those closures that encapsulate a running test-case, to configure all properly.

Also, there is `TSCTestCase`, which adds methods for every found test-case, to work with Xcode's Test Navigator section.
