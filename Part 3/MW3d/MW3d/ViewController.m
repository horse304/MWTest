//
//  ViewController.m
//  MW3d
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtInputHeights;
@property (weak, nonatomic) IBOutlet UITextView *txtResult;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getResult:(id)sender {
    //Hide keyboard and clear result
    [self.txtInputHeights resignFirstResponder];
    self.txtResult.text = @"";
    
    NSArray *heights = [self.txtInputHeights.text componentsSeparatedByString:@","];
    NSArray *validHeights = [self validHeights:heights];
    self.txtInputHeights.text = [validHeights componentsJoinedByString:@","];
    
    if (validHeights.count <= 0) {
        self.txtResult.text = @"Please input some valid heights between 10 and 400!";
        return;
    }
    
    int middleIndex = ceil(validHeights.count*0.5);
    self.txtResult.text = [NSString stringWithFormat:@"%d",[validHeights[middleIndex-1] intValue]];
}

- (NSArray *)validHeights:(NSArray *)inputHeights{
    NSMutableArray *result = [NSMutableArray new];
    for (int i=0; i<inputHeights.count; i++) {
        int heightItem = [inputHeights[i] intValue];
        if (heightItem>=10 && heightItem <=400) {
            [result addObject:[NSNumber numberWithInt:heightItem]];
        }
    }
    
    return result;
}

@end
