//
//  LinkList.m
//  TestLogic
//
//  Created by Sahnawaj Biswas on 14/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import "LinkList.h"

@implementation LinkList

@synthesize node = _node;
@synthesize currentValue = _currentValue;

-(id) init{
    self = [super init];
    if(self){
        _currentValue = INT_MIN;
        self.node = NULL;
    }
    return self;
}

-(void) insertValue:(int)valueToInsert{
    NSLog(@"Node Address : %@",self.node);
    LinkList *nextNode = self.node;
    LinkList *newNode;
    
    if(nextNode == NULL){
        newNode = [[LinkList alloc] init];
        if(newNode){
            newNode.currentValue = valueToInsert;
            self.node = newNode;
        }
    }else{
        if(valueToInsert >= self.currentValue && valueToInsert <= nextNode.currentValue){
            newNode = [[LinkList alloc] init];
            if(newNode){
                newNode.currentValue = valueToInsert;
                newNode.node = nextNode;
                self.node = newNode;
            }
        }else{
            [nextNode insertValue:valueToInsert];
        }
    }
    NSLog(@"Node Address : %@",self.node);
}

-(void) deleteNode:(int) value{
    LinkList *nextnode = self.node;
    LinkList *prevnode = self;
    LinkList *currentNode;
    if(nextnode != NULL && nextnode.currentValue != value){
        prevnode = nextnode;
        currentNode = nextnode.node;
        nextnode = currentNode.node;
        if(currentNode.currentValue == value){
            prevnode.node = nextnode;
        }
        [prevnode deleteNode:value];
    }else{
        prevnode.node = nextnode.node;
    }
}

-(void) swapNode:(int) value1 :(int) value2{
    LinkList *nextnode = self.node;
    LinkList *prevnode=self;
    LinkList *nodeToBeSwaped;
    LinkList *swapNodeWith;
    LinkList *swapNextNode;
    while (nextnode) {
        if(nodeToBeSwaped == nil && nextnode.node.currentValue == value1){
            nodeToBeSwaped = nextnode;
        }
        if(swapNodeWith == nil && nextnode.currentValue == value2){
            swapNodeWith = nextnode;
        }
        
        nextnode = nextnode.node;
    }
    nextnode = self.node;
    LinkList *nodeToBeSwapedPrv;
    LinkList *swapNodeWithPrv;
    while (nextnode) {
        if(nodeToBeSwaped == nextnode.node){
            nodeToBeSwapedPrv = nextnode;
        }
        if(swapNodeWith == nextnode.node){
            swapNodeWithPrv = nextnode;
        }
        
        nextnode = nextnode.node;
    }
    nodeToBeSwapedPrv.node = swapNodeWith;
    swapNodeWithPrv.node = nodeToBeSwaped;
    swapNodeWith.node = nodeToBeSwaped.node;
    nodeToBeSwaped.node =swapNodeWith.node;
//    
//    nodeToBeSwaped.node = swapNodeWith.node;
//    swapNodeWith.node = nodeToBeSwaped;
//    prevnode.node = swapNodeWith;
}
-(void) searchNode:(int) value{
    LinkList *nextnode = self.node;
    
    if(nextnode != NULL){
        if(value == nextnode.currentValue){
            NSLog(@"Node Address : %@, Valaue Found : %d",nextnode, nextnode.currentValue);
        }else{
            [nextnode displayLinkList];
        }
    }
}

-(void) countOccuranceOfNode:(int) value{
    LinkList *nextnode = self.node;
    int count = 0;
    while(nextnode != NULL){
        if(value == nextnode.currentValue){
            count++;
        }
        nextnode = nextnode.node;
    }
    NSLog(@"Value : %d, Valaue Count : %d",value, count);
}

-(void) printAlternateNodes{
    LinkList *nextnode = self.node;
    int count = 1;
    while(nextnode != NULL){
        if(count%2){
            NSLog(@"Value : %d, Valaue Count : %@",nextnode.currentValue, nextnode);
        }
        count++;
        nextnode = nextnode.node;
    }
}

-(void) reverseLinkList{
    LinkList *nextnode;
    LinkList *prevnode = NULL;
    LinkList *currentNode = self;
    
    while (currentNode != NULL) {
        nextnode = currentNode.node;
        currentNode.node = prevnode;
        prevnode = currentNode;
        currentNode = nextnode;
    }
}

-(void) findMiddleIndexOfLinkList{
    LinkList *nextNode = self;
    int len = 0;
    while (nextNode.node != NULL) {
        len++;
        nextNode = nextNode.node;
    }
    
    nextNode = self;
    int middlePosition = 0;
    middlePosition = len/2;
    
    len = 0;
    while (nextNode.node !=NULL) {
        if(middlePosition == len){
            NSLog(@"Value Middle Node: %d", nextNode.currentValue);
            break;
        }
        len++;
        nextNode = nextNode.node;
    }
    
}


-(void) displayLinkList{
    LinkList *nextnode = self.node;
    
    if(nextnode != NULL){
        NSLog(@"Node Address : %@, Valaue : %d",nextnode, nextnode.currentValue);
        [nextnode displayLinkList];
    }
}


@end
