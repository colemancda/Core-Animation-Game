//
//  LevelPickerViewController.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/17/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "LevelPickerViewController.h"

@interface LevelPickerViewController ()

@end

@implementation LevelPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _pageViewController = [[UIPageViewController alloc] init];
    _pageViewController.dataSource = self;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO
                                             animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - UIPageViewController DataSource Protocol

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor grayColor];
    return vc;
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    return vc;
    
}


@end
