//
//  XPC.m
//  XPCservice
//
//  Created by Márton Greber on 12/27/22.
//

#import "XPC.h"

@implementation XPC
- (void)getAnswer:(NSString *)text withReply:(void (^)(NSString * _Nonnull))reply {
    // Implement network call to cheat.sh here
    reply([NSString stringWithFormat:@"%@", text]);
}
@end
