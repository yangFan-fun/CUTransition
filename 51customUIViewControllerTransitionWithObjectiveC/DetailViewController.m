//
//  DetailViewController.m
//  51customUIViewControllerTransitionWithObjectiveC
//
//  Created by 杨帆 on 2021/2/16.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)goback:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
