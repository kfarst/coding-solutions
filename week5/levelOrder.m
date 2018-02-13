/**
 * Definition for binary tree
 * @interface TreeNode: NSObject {
 *     NSInteger val;
 *     TreeNode *left;
 *     TreeNode *right;
 * }
 * @end
 */
@implementation Solution
    - (void) helper: (TreeNode *) A :(NSInteger) depth :(NSMutableArray *)ret {
        if (!A)  return;
        if ([ret count] <= depth) {
            [ret addObject:@[@(A.val)].mutableCopy];
        } else {
            NSMutableArray *arr = [ret objectAtIndex:depth];
            [arr addObject:@(A.val)];
            [ret replaceObjectAtIndex: depth withObject:arr];
        }

        [self helper:A.left :depth+1 :ret];
        [self helper:A.right :depth+1 :ret];
    }
    -(NSMutableArray *) levelOrder:(TreeNode *) A {

        NSMutableArray *ans = [@[] mutableCopy];
        [self helper:A :0 :ans];
        return ans;
    }
@end

