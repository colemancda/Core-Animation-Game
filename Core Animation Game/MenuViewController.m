//
//  MenuViewController.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/17/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"
#import "Level.h"
#import "LevelStore.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES
                                             animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark Buttons
- (IBAction)play:(id)sender {
    
    GameViewController *gameVC = [[GameViewController alloc] initWithLevel:[[LevelStore sharedStore] level:1]];
        
    [self.navigationController pushViewController:gameVC
                                         animated:YES];
    
}
@end
