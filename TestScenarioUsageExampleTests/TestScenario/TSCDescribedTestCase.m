//
//  TSCDescribedTestCase.m
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

#import "TSCDescribedTestCase.h"

@implementation TSCDescribedTestCase

- (instancetype)initWithName:(NSString *)name block:(void (^)(void))block {
    if ((self = [super init])) {
        _name = [name copy];
        _block = block;
    }
    return self;
}

@end
