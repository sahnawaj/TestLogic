//
//  BinarySearchTree.h
//  TestLogic
//
//  Created by Sahnawaj Biswas on 16/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import <Foundation/Foundation.h>

struct Nodes{
    int data;
    
    struct Nodes *leftChildNode;
    struct Nodes *rightChildNode;
};

@interface BinarySearchTree : NSObject{
    struct node *root;
}

@end
