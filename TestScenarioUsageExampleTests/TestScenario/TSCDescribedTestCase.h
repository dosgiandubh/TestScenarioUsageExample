//
//  TSCDescribedTestCase.h
//  TestScenario
//
//  Created by dosgiandubh on 05/02/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSCDescribedTestCase : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) void (^block)(void);

- (instancetype)initWithName:(NSString *)name block:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
