//
//  ViewController.m
//  51customUIViewControllerTransitionWithObjectiveC
//
//  Created by 杨帆 on 2021/2/16.
//

#import "ViewController.h"
#import "CUTransition.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) CUTransition *cuTransition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cuTransition = [[CUTransition alloc] init];
    // Do any additional setup after loading the view.
}

- (IBAction)presentAction:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    
    // [self _customModalTransitionWithViewController:vc];
    [self _customNavigationControllerTransitionWithViewController:vc];
}


// MARK: -


/// 模态视图自定义转场
- (void)_customModalTransitionWithViewController:(UIViewController *)viewController {
    viewController.modalPresentationStyle = UIModalPresentationFullScreen;
    viewController.transitioningDelegate = self;
    [self presentViewController:viewController animated:YES completion:nil];
}

// 转场开始
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.cuTransition.isPush = YES;
    return self.cuTransition;
}


// 转场结束
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.cuTransition.isPush = NO;
    return self.cuTransition;
}


// MARK: -

/// 导航栏自定义转场
- (void)_customNavigationControllerTransitionWithViewController:(UIViewController *)viewController {
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:viewController animated:YES];
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        self.cuTransition.isPush = YES;
        return self.cuTransition;
    } else if (operation == UINavigationControllerOperationPop) {
        self.cuTransition.isPush = NO;
    }
    return self.cuTransition;
}


@end
