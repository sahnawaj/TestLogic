//
//  BinarySearchTree.m
//  TestLogic
//
//  Created by Sahnawaj Biswas on 16/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import "BinarySearchTree.h"

@implementation BinarySearchTree
-(id) init{
    self = [super init];
    if(self){
        root = NULL;
        int array[7] = { 27, 14, 35, 10, 19, 31, 42 };
        NSLog(@"Commit Changes From Branch");
    }
    return self;
}
@end
