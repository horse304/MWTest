//
//  ViewController.m
//  MW3e
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtTShirt;
@property (weak, nonatomic) IBOutlet UITextField *txtBasket;
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
    
    int numberTShirt = [self.txtTShirt.text intValue];
    int numberBasket = [self.txtBasket.text intValue];
    
    if (numberTShirt<numberBasket) {
        self.txtResult.text = @"0";
        return;
    }
    
    if (numberBasket==1){
        self.txtResult.text = [NSString stringWithFormat:@"%d",numberTShirt];
        return;
    }
    
    int result = 1;
    
    for (int i=numberTShirt; i>=(numberTShirt-numberBasket+1); i--) {
        result*=i;
    }
    result *= pow(numberBasket, (numberTShirt-numberBasket));
    
    self.txtResult.text = [NSString stringWithFormat:@"%d ways",result];
}

@end
