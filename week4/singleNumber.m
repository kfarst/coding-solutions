@implementation Solution
	-(NSInteger) singleNumber:(NSArray *) A  {
		int val = 0;
	    for( NSNumber *num in A ) {
	        int cur = [num intValue];
	        val ^= cur;
	    }

	    return val;
	}
@end
