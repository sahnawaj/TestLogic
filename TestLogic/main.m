//
//  main.m
//  TestLogic
//
//  Created by Sahnawaj Biswas on 13/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LinkList.h"
int main(int argc, char * argv[]) {
    @autoreleasepool {
        LinkList *list = [[LinkList alloc] init];
        [list insertValue:100];
        [list insertValue:20];
        [list insertValue:15];
        [list insertValue:10];
        [list insertValue:90];
        [list insertValue:15];
        [list insertValue:10];
        [list insertValue:90];
        
        [list displayLinkList];
        
        [list findMiddleIndexOfLinkList];
        
        [list insertValue:99];
        
        [list displayLinkList];
       
        
//        [list deleteNode:10];
//        
//        [list displayLinkList];
        
//        [list swapNode:15 :90];
//        
//        [list displayLinkList];
        
//        [list reverseLinkList];
//        
//        [list displayLinkList];
        [list searchNode:10];
        
        [list countOccuranceOfNode:10];
        
        [list printAlternateNodes];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
    
}
void printLList(LinkList *list){
    while (list.node != NULL) {
        NSLog(@"%d",list.currentValue);
        list = list.node;
    }
}
