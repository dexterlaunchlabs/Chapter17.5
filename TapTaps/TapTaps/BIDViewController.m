//
//  BIDViewController.m
//  TapTaps
//
//  Created by Dexter Launchlabs on 7/31/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()
@property (weak, nonatomic) IBOutlet UILabel *singleLabel; @property (weak, nonatomic) IBOutlet UILabel *doubleLabel; @property (weak, nonatomic) IBOutlet UILabel *tripleLabel; @property (weak, nonatomic) IBOutlet UILabel *quadrupleLabel; - (void)tap1;
- (void)tap2;
- (void)tap3;
- (void)tap4;
- (void)eraseMe:(UILabel *)label;
@end

@implementation BIDViewController
@synthesize singleLabel; @synthesize doubleLabel; @synthesize tripleLabel; @synthesize quadrupleLabel;
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
    UITapGestureRecognizer *singleTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1)];
    singleTap.numberOfTapsRequired = 1; singleTap.numberOfTouchesRequired = 1; [self.view addGestureRecognizer:singleTap];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(tap2)];
    doubleTap.numberOfTapsRequired = 2; doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap]; [singleTap requireGestureRecognizerToFail:doubleTap];
    UITapGestureRecognizer *tripleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(tap3)];
    tripleTap.numberOfTapsRequired = 3; tripleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tripleTap]; [doubleTap requireGestureRecognizerToFail:tripleTap];
    UITapGestureRecognizer *quadrupleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                   action:@selector(tap4)];
    quadrupleTap.numberOfTapsRequired = 4; quadrupleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:quadrupleTap]; [tripleTap requireGestureRecognizerToFail:quadrupleTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tap1 {
    singleLabel.text = @"Single Tap Detected"; [self performSelector:@selector(eraseMe:)
                                                          withObject:singleLabel afterDelay:1.6f];
}
- (void)tap2 {
    doubleLabel.text = @"Double Tap Detected"; [self performSelector:@selector(eraseMe:)
                                                          withObject:doubleLabel afterDelay:1.6f];
}
- (void)tap3 {
    tripleLabel.text = @"Triple Tap Detected"; [self performSelector:@selector(eraseMe:)
                                                          withObject:tripleLabel afterDelay:1.6f];
}
- (void)tap4 {
    quadrupleLabel.text = @"Quadruple Tap Detected"; [self performSelector:@selector(eraseMe:)
                                                                withObject:quadrupleLabel afterDelay:1.6f];
}
- (void)eraseMe:(UILabel *)label { label.text = @"";
}
- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view. // e.g. self.myOutlet = nil;
    self.singleLabel = nil;
    self.doubleLabel = nil;
    self.tripleLabel = nil;
    self.quadrupleLabel = nil;
}
@end
