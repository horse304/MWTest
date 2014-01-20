//
//  ViewController.m
//  MW3f
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtInput.text = @"1,2,3\n4,5,6\n7,8,9";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rotateMatrix:(id)sender {
    [self.txtInput resignFirstResponder];
    
    NSMutableArray *matrix = [self validateMatrix:self.txtInput.text];
    if (matrix) {
        self.txtInput.text = @"";
        for (int i=0; i<matrix.count; i++) {
            for (int j=0; j<matrix.count; j++) {
                NSString *item = matrix[(matrix.count - 1)-j][i];
                self.txtInput.text = [NSString stringWithFormat:@"%@%@",self.txtInput.text,item];
                if (j<matrix.count-1) {
                    self.txtInput.text = [NSString stringWithFormat:@"%@,",self.txtInput.text];
                }
            }
            
            if (i<matrix.count -1) {
                self.txtInput.text = [NSString stringWithFormat:@"%@\n",self.txtInput.text];
            }
        }
    }
}

- (NSMutableArray *)validateMatrix:(NSString *)matrixString{
    NSMutableArray *result = [NSMutableArray new];
    NSArray *matrixRows = [matrixString componentsSeparatedByString:@"\n"];
    for (int i=0; i<matrixRows.count; i++) {
        NSArray *rowItem = [matrixRows[i] componentsSeparatedByString:@","];
        if (rowItem.count != matrixRows.count) {
            return NULL;
        }
        [result addObject:rowItem];
    }
    
    return result;
}

@end
