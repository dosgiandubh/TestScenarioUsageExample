//
//  TSCTestCase.m
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

#import "TSCTestCase.h"
#import "TSCDescribedTestCase.h"

extern IMP imp_implementationWithBlock(id block);
extern BOOL class_addMethod(Class, SEL, IMP, const char *);

@implementation TSCTestCase

+ (void)generateTestCase:(TSCDescribedTestCase *)testCase {
    [self addInstanceMethodWithClassSelectorName:testCase.name block:testCase.block];
}

+ (NSArray<NSInvocation *> *)testInvocations {
    [self start];

    return [super testInvocations];
}

+ (void)start {}

+ (void)addInstanceMethodWithClassSelectorName:(NSString *)selectorName block:(void (^)(void))block {
    IMP implementation = imp_implementationWithBlock(^(id selfValue){
        block();
    });

    const char *types = [[NSString stringWithFormat:@"%s%s%s", @encode(void), @encode(id), @encode(SEL)] UTF8String];

    SEL selector = NSSelectorFromString(selectorName);
    if (!class_addMethod(self, selector, implementation, types)) {
        [NSException raise:@"Failed to add a test-case into TestCase"
                    format:@"Invalid or duplicated method '%@'. "
                           @"Please, check that it does not contain invalid characters "
                           @"and is unique within '%@' type.", selectorName, NSStringFromClass(self)];
    }
}

@end
