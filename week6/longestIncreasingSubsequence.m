@implementation Solution
-(NSInteger) lis:(NSArray *) A  {
    NSMutableArray *arr = @[].mutableCopy;

    for (int i = 0; i < [A count]; ++i) {
        NSInteger idx = [self lower_bound:arr :[[A objectAtIndex:i] integerValue]];
        if (idx == -1)  [arr addObject:[A objectAtIndex:i]];
        else {
            [arr replaceObjectAtIndex:idx withObject:[A objectAtIndex:i]];
        }
    }
    return [arr count];
}

  -(NSInteger) lower_bound:(NSMutableArray *)A :(NSInteger) target {
      int left = 0, right = [A count] -1;
      while (left <= right) {
          int mid = left + (right - left) / 2;
          if([[A objectAtIndex:mid] integerValue] < target) left = mid + 1;
          else {
              right = mid - 1;
          }
      }
      if (left >= [A count]) return -1;
      else return left;
  }
@end
