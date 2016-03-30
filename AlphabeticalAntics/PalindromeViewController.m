//
//  ViewController.m
//  AlphabeticalAntics
//
//  Created by Jeremy Ong on 30/03/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "PalindromeViewController.h"

@interface PalindromeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *responseLabel;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;

@end

@implementation PalindromeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onCheckButtonPressed:(id)sender {
	NSString *word = [self.wordTextField.text lowercaseString];
	NSString *parsedWord = [[word componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
	for (NSUInteger index = 0; index < [parsedWord length]/2; index++) {
		char charOne = [parsedWord characterAtIndex:index];
		NSUInteger indexFromBehind = [parsedWord length] - 1 - index;
		char charTwo = [parsedWord characterAtIndex:indexFromBehind];
		if (charOne != charTwo) {
			self.responseLabel.text = @"Not a palindrome!";
			return;
		}
	}
		self.responseLabel.text = @"Is a palindrome!";
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
