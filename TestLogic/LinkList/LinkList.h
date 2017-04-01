//
//  LinkList.h
//  TestLogic
//
//  Created by Sahnawaj Biswas on 14/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkList : NSObject{
    LinkList *node;
    int currentValue;
}

@property(readwrite) LinkList *node;
@property(assign) int currentValue;

-(void) insertValue:(int)valueToInsert;
-(void) displayLinkList;
-(void) deleteNode:(int) value;
-(void) swapNode:(int) value1 :(int) value2;

-(void) reverseLinkList;


-(void) searchNode:(int) value;
-(void) countOccuranceOfNode:(int) value;
-(void) printAlternateNodes;
-(void) findMiddleIndexOfLinkList;

-(void) removeDuplicatesFromSortedLinkList;
-(void) checkLinkListIsPalindrome;
@end
