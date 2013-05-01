//
//  OrientViewController.m
//  orientapp
//
//  Created by Brian Jacobel on 2/26/13.
//  Copyright (c) 2013 com.bowdoinorient. All rights reserved.
//

#import "OrientViewController.h"
#import "OrientSectionViewController.h"


@implementation OrientViewController

@synthesize webView = _webView;
@synthesize sectionLabel = _sectionLabel;
@synthesize sectionButton = _sectionButton;


// Loads the Orient homepage 
- (void) viewDidLoad {
    [super viewDidLoad];
    NSString *fullURL = @"http://www.bowdoinorient.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
    
    [self.sectionLabel setFont:[UIFont fontWithName:@"Minion Pro Med" size:8]];
    
    // section scroll view setup
    
    self.sectionScrollView.pagingEnabled = YES;
    self.sectionScrollView.delegate = self;
    
    CGFloat xPos = 0;
    CGFloat yPos = self.sectionScrollView.frame.origin.y;
    CGFloat width = self.sectionScrollView.bounds.size.width;
    CGFloat height = self.sectionScrollView.bounds.size.height;
    int numberOfSections = 6;
    
    for (int i = 0; i < numberOfSections; i++)
    {
        xPos = i * self.view.frame.size.width;
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(xPos, 0, width, height)];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor grayColor];
        
        switch (i) {
            case 0:
                
                label.text = @"Home";
                break;
            case 1:
                //view.backgroundColor = [UIColor greenColor];
                label.text = @"News";
                break;
            case 2:
                //view.backgroundColor = [UIColor blueColor];
                label.text = @"Opinion";
                break;
            case 3:
                label.text = @"Features";
                break;
            case 4:
                label.text = @"Arts and Entertainment";
                break;
            case 5:
                label.text = @"Sports";
                
            default:view.backgroundColor = [UIColor grayColor];
                break;
        }
        view.userInteractionEnabled = YES;
        //view.backgroundColor = [UIColor colorWithRed:(i * 25) green:(i * 60) blue:(i * 12) alpha:1.0];
        [view addSubview:label];
        
        //label.userInteractionEnabled = YES;
        
        [self.sectionScrollView addSubview:view];
        NSLog(@"1 xPos = %f", xPos);
        //xPos += width;
        //NSLog(@"2 xPos = %f", xPos);
    }
    self.sectionScrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfSections, self.sectionScrollView.frame.size.height);

}

- (IBAction)homeButtonPressed:(UIButton *)sender {
    NSString *fullURL = @"http://www.bowdoinorient.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OrientSectionViewController* orientSectionViewController = (OrientSectionViewController*)[segue destinationViewController];
}

@end
