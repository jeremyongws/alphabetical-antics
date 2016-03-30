//
//  AnagramViewController.m
//  AlphabeticalAntics
//
//  Created by Jeremy Ong on 30/03/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "AnagramViewController.h"

@interface AnagramViewController ()
@property (weak, nonatomic) IBOutlet UILabel *anagramLabel;
@property (weak, nonatomic) IBOutlet UITextField *wordOne;
@property (weak, nonatomic) IBOutlet UITextField *wordTwo;

@end

@implementation AnagramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onCheckButtonPressed:(id)sender {
	NSString *firstWord = self.wordOne.text;
	NSString *secondWord = self.wordTwo.text;
	NSMutableArray *firstWordArray = [[NSMutableArray alloc] initWithCapacity:[firstWord length]];
	NSMutableArray *secondWordArray = [[NSMutableArray alloc] initWithCapacity:[secondWord length]];
	
	if ([firstWord length] != [secondWord length]){
		self.anagramLabel.text = @"Boo, not anagrams!";
		return;
	} else {
		for (int i = 0; i < [firstWord length]; i++) {
			NSString *firstWordLetter = [NSString stringWithFormat:@"%c", [firstWord characterAtIndex:i]];
			NSString *secondWordLetter = [NSString stringWithFormat:@"%c", [secondWord characterAtIndex:i]];
			[firstWordArray addObject:firstWordLetter];
			[secondWordArray addObject:secondWordLetter];
		}
	}
	NSArray *sortedFirstWordArray = [firstWordArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	NSArray *sortedSecondWordArray = [secondWordArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
	
	if ([sortedFirstWordArray isEqualToArray:sortedSecondWordArray]){
		self.anagramLabel.text = @"They are anagrams!";
	} else {
		self.anagramLabel.text = @"Boo, not anagrams!";
	}
}



@end
