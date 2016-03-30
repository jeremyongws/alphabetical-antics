//
//  IsogramViewController.m
//  AlphabeticalAntics
//
//  Created by Jeremy Ong on 30/03/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "IsogramViewController.h"

@interface IsogramViewController ()
@property (weak, nonatomic) IBOutlet UILabel *isogramLabel;
@property (weak, nonatomic) IBOutlet UITextField *isogramTextField;

@end

@implementation IsogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onCheckButtonPressed:(id)sender {
	NSString *word = self.isogramTextField.text;
	for (NSUInteger index = 0; index < [word length]-1; index++) {
		char letter = [word characterAtIndex:index];
		NSLog(@"Comparing this letter %c", letter);
		
		for (NSUInteger remainderIndex = index + 1; remainderIndex < [word length]; remainderIndex++) {
			char comparedLetter = [word characterAtIndex:remainderIndex];
			if (letter == comparedLetter){
				self.isogramLabel.text = @"Not an isogram!";
				return;
			}
		}
		self.isogramLabel.text = @"We have an isogram!";
	}
}

@end
