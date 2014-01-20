//
//  ViewController.m
//  MW3g
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputArray1;
@property (weak, nonatomic) IBOutlet UITextField *txtInputArray2;
@property (weak, nonatomic) IBOutlet UITextField *txtInputK;
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
    self.editing = NO;
    self.txtResult.text = @"";
    
    NSArray * array1 = [self.inputArray1.text componentsSeparatedByString:@","];
    NSArray * array2 = [self.txtInputArray2.text componentsSeparatedByString:@","];
    int index = 0;
    int i1=0,i2 = 0;
    while (i1<array1.count || i2<array2.count) {
        if (index == k) {
            <#statements#>
        }
    }
}

@end
