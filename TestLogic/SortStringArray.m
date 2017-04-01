//
//  SortStringArray.m
//  TestLogic
//
//  Created by Sahnawaj Biswas on 16/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import "SortStringArray.h"

@implementation SortStringArray

-(id) init{
    self = [super init];
    if(self){
        stringArrayToSort = [[NSMutableArray alloc] initWithArray:@[@"C",@"G",@"B",@"A",@"F",@"a",@"g",@"f"]];
        
        NSLog(@"Bubble Sort String Array : %@",[self sortStringArrayBubbleSort:stringArrayToSort]);
        [self sortStringArray];
        mergStrArySort = [[NSMutableArray alloc] initWithArray:@[@"1ABC",@"CBD",@"AAB",@"0AAD"]];
        [self mergeSort:mergStrArySort];
        NSLog(@"%@",mergStrArySort);
    }
    return self;
}

//--------------BUBBLE SORT--------------------
-(NSString *) sortStringArrayBubbleSort:(NSMutableArray *)stringToSort{
    NSMutableString *str = [[NSMutableString alloc] init];
    for (int i = 0; i < [stringToSort count]; i++) {
        for(int j = i+1 ; j < [stringToSort count];j++){
            int ix = (int)[[[stringToSort objectAtIndex:i] lowercaseString] characterAtIndex:0];
            int jx = (int)[[[stringToSort objectAtIndex:j] lowercaseString] characterAtIndex:0];
            //NSLog(@"%@=%d, %@ = %d",[stringToSort objectAtIndex:i],ix,[stringToSort objectAtIndex:j],jx);
            if(ix > jx){
                NSString *chr = [stringToSort objectAtIndex:i];
                [stringToSort replaceObjectAtIndex:i withObject:[stringToSort objectAtIndex:j]];
                [stringToSort replaceObjectAtIndex:j withObject:chr];
            }
        }
        [str appendString:[stringToSort objectAtIndex:i]];
    }
    return str;
}
//--------------BUBBLE SORT END--------------------

//--------------COMPARE TWO STRING--------------------
-(int) stringComparator:(NSString *)str1 :(NSString *)str2{
    int r = 0;
    int l = 0;
    if(str1.length >= str2.length)
        l = str2.length;
    else
        l = str1.length;
    for(int i = 0 ; i < l ; i++){
        if([str1 characterAtIndex:i] > [str2 characterAtIndex:i]){
            r = 1;
            break;
        }
    }
    return r;
}
//--------------COMPARE TWO STRING END--------------------

//--------------BUBBLE SORT--------------------
-(void) sortStringArray{
    NSMutableArray *chAry = [[NSMutableArray alloc] initWithArray:@[@"1ABC",@"CBD",@"AAB",@"0AAD"]];
    NSString *str;
    for(int i = 0; i < [chAry count]; i++){
        
        for (int j = i+1 ; j < [chAry count]; j++) {
            if([self stringComparator:[chAry objectAtIndex:i] :[chAry objectAtIndex:j]] > 0){
                str = [chAry objectAtIndex:i];
                [chAry replaceObjectAtIndex:i withObject:[chAry objectAtIndex:j]];
                [chAry replaceObjectAtIndex:j withObject:str];
            }
        }
    }
    
    NSLog(@"%@",chAry);
}
//--------------BUBBLE SORT END--------------------

//-------------------MERGE SORT LOGIC ---------------
-(void) merger:(NSMutableArray *)LA :(NSMutableArray *)RA :(NSMutableArray *)A{
    int lenLA = [LA count];
    int lenRA = [RA count];
    int k=0;
    int i=0,j=0;
    while (i < lenLA && j < lenRA) {
        if([self stringComparator:[LA objectAtIndex:i] :[RA objectAtIndex:j]] == 0){
            [A replaceObjectAtIndex:k withObject:[LA objectAtIndex:i]];
            i++;
        }else{
            [A replaceObjectAtIndex:k withObject:[RA objectAtIndex:j]];
            j++;
        }
        k++;
    }
    while (i < lenLA) {
        [A replaceObjectAtIndex:k withObject:[LA objectAtIndex:i]];
        i++;
        k++;
    }
    while (j < lenRA) {
        [A replaceObjectAtIndex:k withObject:[RA objectAtIndex:j]];
        j++;
        k++;
    }
}

-(void) mergeSort:(NSMutableArray *) Ary{
    int len = [Ary count];
    int mid = len/2;
    int x=0;
    if(len < 2) return;
    
    NSMutableArray *LA = [[NSMutableArray alloc] initWithCapacity:mid];
    NSMutableArray *RA = [[NSMutableArray alloc] initWithCapacity:len-mid];
    for (int i = 0 ; i < mid; i++) {
        [LA addObject:[Ary objectAtIndex:i]];
    }
    for (int i = mid ; i < len; i++) {
        [RA addObject:[Ary objectAtIndex:i]];
        x++;
    }
    [self mergeSort:LA];
    [self mergeSort:RA];
    [self merger:LA :RA :Ary];
}
//-------------------MERGE SORT LOGIC END---------------
@end
