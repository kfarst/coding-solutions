@implementation Solution
-(NSInteger) longestSubsequenceLength:(NSArray *) A  {
    NSMutableArray *inc = [NSMutableArray arrayWithCapacity:[A count]];
    NSMutableArray *dec = [NSMutableArray arrayWithCapacity:[A count]];
    NSInteger targetVal = 0, currVal = 0;
    for(NSInteger i=0;i<[A count];i++) {
        [inc addObject:@(1)];
        [dec addObject:@(1)];
    }

    //increasing
    for(NSInteger i=1;i<[A count];i++) {
        targetVal = [[A objectAtIndex:i] intValue];
        for(NSInteger j=0;j<i;j++) {
            currVal = [[A objectAtIndex:j] intValue];
            if (currVal < targetVal && [[inc objectAtIndex:i]intValue] < [[inc objectAtIndex:j]intValue]+1) {
                [inc replaceObjectAtIndex:i withObject:@([[inc objectAtIndex:j]intValue]+1)];
            }
        }
    }
    //decreasing
    for(NSInteger i=[A count]-2;i>=0;i--) {
        targetVal = [[A objectAtIndex:i] intValue];
        for(NSInteger j=[A count]-1;j>i;j--) {
            currVal = [[A objectAtIndex:j] intValue];
            if (currVal < targetVal && [[dec objectAtIndex:i]intValue] < [[dec objectAtIndex:j]intValue]+1) {
                [dec replaceObjectAtIndex:i withObject:@([[dec objectAtIndex:j]intValue]+1)];
            }
        }
    }
    //NSLog(@"inc = %@", inc);
    //NSLog(@"dec = %@", dec);
    //max
    NSInteger max = 0, currMax = 0;
    for(NSInteger i=0;i<[A count];i++) {
        currMax = [[inc objectAtIndex:i]intValue] + [[dec objectAtIndex:i]intValue] -1;
        max = MAX(currMax, max);
    }

    return max;//[max intValue];
    //1 3 5 6 4 8 4 3 2 1
}
@end

