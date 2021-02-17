//
//  CUTransition.h
//  51customUIViewControllerTransitionWithObjectiveC
//
//  Created by 杨帆 on 2021/2/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPush;

@end

NS_ASSUME_NONNULL_END
