//
//  TestCase.h
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

#import <Foundation/Foundation.h>
@import XCTest;

@class TSCDescribedTestCase;

NS_ASSUME_NONNULL_BEGIN

@interface TSCTestCase : XCTestCase

+ (void)generateTestCase:(TSCDescribedTestCase *)testCase NS_SWIFT_NAME(generate(_:));
+ (void)start;

@end

NS_ASSUME_NONNULL_END
