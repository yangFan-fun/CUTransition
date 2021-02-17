//
//  CUTransition.m
//  51customUIViewControllerTransitionWithObjectiveC
//
//  Created by 杨帆 on 2021/2/17.
//

#import "CUTransition.h"

@implementation CUTransition

// 转场动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

// 转场动画内容
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    if (self.isPush) {
        [self _showWith:transitionContext];
    } else {
        [self _dismiss:transitionContext];
    }
}

- (void)_showWith:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 从上下文中获取控制器
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    
    [transitionContext.containerView addSubview:toView];
    
    // 转场逻辑
    // fromView.alpha = 1.0;
    toView.alpha = 0.0;
    toView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height / 2);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        // fromView.alpha = 0.0;
        toView.alpha = 1.0;
        // fromView.transform = CGAffineTransformMakeTranslation(- [UIScreen mainScreen].bounds.size.width, 0);
        toView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)_dismiss:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromViewController.view;
    UIView *toView = toViewController.view;
    [transitionContext.containerView addSubview:toView];
    
    fromView.alpha = 1.0;
    toView.alpha = 0.0;
    toView.transform = CGAffineTransformMakeTranslation(- [UIScreen mainScreen].bounds.size.width, 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.alpha = 0.0;
        toView.alpha = 1.0;
        fromView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}


@end
