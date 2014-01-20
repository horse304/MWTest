//
//  ViewController.m
//  MW3a
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtInput;
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
- (IBAction)genCombinations:(id)sender {
    [self.txtInput resignFirstResponder];
    self.txtResult.text = @"";
    
    //Validate Input
    if (![self.txtInput.text isEqualToString:@""]) {
        int input = [self.txtInput.text integerValue];
        NSMutableArray * numbers = [NSMutableArray new];
        for (int i=1; i<=input; i++) {
            [numbers addObject:[NSNumber numberWithInt:i]];
        }
        
        [self addCombination:numbers];
        for (int i=0; i<numbers.count-1; i++) {
            for (int j=i+1; j<numbers.count; j++) {
                NSNumber *a = [numbers objectAtIndex:i];
                NSNumber *b = [numbers objectAtIndex:j];
                NSMutableArray *combination = [numbers mutableCopy];
                [combination replaceObjectAtIndex:i withObject:b];
                [combination replaceObjectAtIndex:j withObject:a];
                [self addCombination:combination];
                
            }
        }
    }
}

- (void)addCombination:(NSMutableArray *)combination{
    self.txtResult.text = [NSString stringWithFormat:@"%@\n",self.txtResult.text];
    for (int i=0; i<combination.count; i++) {
        self.txtResult.text = [NSString stringWithFormat:@"%@%d,",self.txtResult.text,[combination[i] integerValue]];
    }
}

@end
