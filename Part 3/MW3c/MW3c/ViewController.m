//
//  ViewController.m
//  MW3c
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "ViewController.h"
#import "LinkedListItem.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray * allItems;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    LinkedListItem * item1 = [[LinkedListItem alloc] initWithValue:1];
    LinkedListItem * item2 = [[LinkedListItem alloc] initWithValue:2];
    LinkedListItem * item3 = [[LinkedListItem alloc] initWithValue:3];
    LinkedListItem * item4 = [[LinkedListItem alloc] initWithValue:4];
    LinkedListItem * item5 = [[LinkedListItem alloc] initWithValue:5];
    LinkedListItem * item6 = [[LinkedListItem alloc] initWithValue:6];
    self.allItems = @[item1,item2,item3,item4,item5,item6]; //For keeping all items alive in application only
    
    item1.nextItem = item2;
    item2.nextItem = item3;
    item3.nextItem = item4;
    item4.nextItem = item5;
    item5.nextItem = item6;
    item6.nextItem = item2;
	// Do any additional setup after loading the view, typically from a nib.
    
    if([self checkLoop]){
        [[[UIAlertView alloc] initWithTitle:@"Checking Loop" message:@"This linked list has loop" delegate:NULL cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Checking Loop" message:@"This linked list has no loop" delegate:NULL cancelButtonTitle:@"Done" otherButtonTitles:nil] show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)checkLoop{
    if (self.allItems.count>0) {
        LinkedListItem *nodeA = self.allItems[0];
        LinkedListItem *nodeB = nodeA.nextItem;
        
        while (nodeB != NULL) {
            nodeA = nodeA.nextItem;
            if (nodeB.nextItem == NULL) {
                return false;
            }
            
            nodeB = nodeB.nextItem.nextItem;
            if (nodeA == nodeB) {
                return true;
            }
        }
        
        return false;
    }else{
        return false;
    }
}

@end
