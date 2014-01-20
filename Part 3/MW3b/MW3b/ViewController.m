//
//  ViewController.m
//  MW3b
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtInputNumbers;
@property (weak, nonatomic) IBOutlet UITextField *txtCountMinimumNum;
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
    //Close keyboard and reset result
    self.editing = NO;
    self.txtResult.text = @"";
    
    NSMutableArray *numbers = [[self.txtInputNumbers.text componentsSeparatedByString:@","] mutableCopy];
    
    //Validate
    if ([self.txtCountMinimumNum.text intValue] > numbers.count) {
        self.txtResult.text = @"Count of minimum should less than or equal to count of input numbers";
        return;
    }
    for (int i=1; i<=[self.txtCountMinimumNum.text intValue]; i++) {
        int minimumNumber = [numbers[0] intValue];
        int minimumIndex = 0;
        for (int j=1; j<numbers.count; j++) {
            int numberAtJ = [numbers[j] intValue];
            if (numberAtJ<minimumNumber) {
                minimumNumber = numberAtJ;
                minimumIndex = j;
            }
        }
        [numbers removeObjectAtIndex:minimumIndex];
        
        [self addMinimum:minimumNumber];
    }
}

- (void)addMinimum:(int)number{
    self.txtResult.text = [NSString stringWithFormat:@"%@\n%d",self.txtResult.text, number];
}

@end
