//
//  ViewController.m
//  AutoLayout-NSLayoutConstraints
//
//  Created by Admin on 21.10.15.
//  Copyright (c) 2015 OlhaF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel * lable;
@property (weak, nonatomic) IBOutlet UIButton * clearButton;
@property (weak, nonatomic) IBOutlet UIButton * loadButton;

@property (strong, nonatomic) NSString * textInfoForLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * fileAddress = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@".txt"];
    self.textInfoForLable = [NSString stringWithContentsOfFile:fileAddress encoding:NSASCIIStringEncoding error:nil];
    
    [self setConstraintsToLoadButton];
    [self setConstraintsToClearButton];
    [self setConstraintsToLable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Set buttons and label;
- (void) setConstraintsToLoadButton
{
    self.loadButton.layer.borderWidth = 1.0f;
    self.loadButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.loadButton.layer.cornerRadius = 8.0f;
    
    self.loadButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint * constrLoadRight =
    [NSLayoutConstraint constraintWithItem:self.loadButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-10];
    
    NSLayoutConstraint * constrLoadBottom =
    [NSLayoutConstraint constraintWithItem:self.loadButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-10];
    
    [self.view addConstraints:@[constrLoadRight, constrLoadBottom]];
}

- (void) setConstraintsToClearButton
{
    self.clearButton.layer.borderWidth = 1.0f;
    self.clearButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.clearButton.layer.cornerRadius = 8.0f;
    
    self.clearButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint * constrClearRight =
    [NSLayoutConstraint constraintWithItem:self.clearButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:10];
    
    NSLayoutConstraint * constrClearBottom =
    [NSLayoutConstraint constraintWithItem:self.clearButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-10];
    
    [self.view addConstraints:@[constrClearRight, constrClearBottom]];
}

- (void) setConstraintsToLable
{
    self.lable.text=@"You can load information";
    self.lable.translatesAutoresizingMaskIntoConstraints = NO;
    self.lable.backgroundColor = [UIColor blueColor];
    self.lable.textColor = [UIColor whiteColor];
    self.lable.font = [UIFont fontWithName:@"Baskerville" size:14];
    self.lable.textAlignment = NSTextAlignmentCenter;
    
    NSLayoutConstraint * constrLableLeft =
    [NSLayoutConstraint constraintWithItem:self.lable attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:25];
    
    NSLayoutConstraint * constrLableRight =
    [NSLayoutConstraint constraintWithItem:self.lable attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:-25];
    
    NSLayoutConstraint * constrLableTop =
    [NSLayoutConstraint constraintWithItem:self.lable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:30];
    
    NSLayoutConstraint * constrLableBottom =
    [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.lable attribute:NSLayoutAttributeBottom multiplier:1.0f constant:100];
    
    NSLayoutConstraint * constrLableMinHight =
    [NSLayoutConstraint constraintWithItem:self.lable attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
    
    [self.view addConstraints:@[constrLableLeft, constrLableRight, constrLableTop, constrLableBottom, constrLableMinHight]];
}

#pragma mark - Button Actions

- (IBAction)loadAction:(UIButton*)sender
{
    self.lable.text = self.textInfoForLable;
}

- (IBAction)clearAction:(UIButton*)sender
{
    self.lable.text  = @"";
}

@end
